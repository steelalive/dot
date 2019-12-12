# Grammalecte for Writer
# License: MPL 2
# A derivative work of Lightproof from László Németh (http://cgit.freedesktop.org/libreoffice/lightproof/)

import uno
import unohelper
import json
import sys
import traceback
from collections import deque

from com.sun.star.linguistic2 import XProofreader, XSupportedLocales
from com.sun.star.linguistic2 import ProofreadingResult
from com.sun.star.lang import XServiceInfo, XServiceName, XServiceDisplayName
from com.sun.star.lang import Locale

import helpers
import grammalecte.fr as gce
#import lightproof_handler_grammalecte as opt_handler
import Options


class Grammalecte (unohelper.Base, XProofreader, XServiceInfo, XServiceName, XServiceDisplayName, XSupportedLocales):

    def __init__ (self, ctx, *args):
        self.ctx = ctx
        self.ServiceName = "com.sun.star.linguistic2.Proofreader"
        self.ImplementationName = "org.openoffice.comp.pyuno.Lightproof." + gce.pkg
        self.SupportedServiceNames = (self.ServiceName, )
        self.locales = []
        for i in gce.locales:
            l = gce.locales[i]
            self.locales.append(Locale(l[0], l[1], l[2]))
        self.locales = tuple(self.locales)
        # debug
        #helpers.startConsole()
        # init
        gce.load("Writer", "nInt")
        # GC options
        #xContext = uno.getComponentContext()
        #opt_handler.load(xContext)
        dOpt = Options.loadOptions("fr")
        gce.setOptions(dOpt)
        # dictionaries options
        self.loadUserDictionaries()
        # underlining options
        self.setWriterUnderliningStyle()
        # store for results of big paragraphs
        self.dResult = {}
        self.nMaxRes = 1500
        self.lLastRes = deque(maxlen=self.nMaxRes)
        self.nRes = 0


    # XServiceName method implementations
    def getServiceName (self):
        return self.ImplementationName

    # XServiceInfo method implementations
    def getImplementationName (self):
        return self.ImplementationName

    def supportsService (self, ServiceName):
        return (ServiceName in self.SupportedServiceNames)

    def getSupportedServiceNames (self):
        return self.SupportedServiceNames

    # XSupportedLocales
    def hasLocale (self, aLocale):
        if aLocale in self.locales:
            return True
        for i in self.locales:
            if (i.Country == aLocale.Country or i.Country == "") and aLocale.Language == i.Language:
                return True
        return False

    def getLocales (self):
        return self.locales

    # XProofreader
    def isSpellChecker (self):
        return False

    def doProofreading (self, nDocId, rText, rLocale, nStartOfSentencePos, nSuggestedSentenceEndPos, rProperties):
        xRes = ProofreadingResult()
        #xRes = uno.createUnoStruct("com.sun.star.linguistic2.ProofreadingResult")
        xRes.aDocumentIdentifier = nDocId
        xRes.aText = rText
        xRes.aLocale = rLocale
        xRes.nStartOfSentencePosition = nStartOfSentencePos
        xRes.nStartOfNextSentencePosition = nSuggestedSentenceEndPos
        xRes.aProperties = ()
        xRes.xProofreader = self
        xRes.aErrors = ()

        # PATCH FOR LO 4
        # Fix for http://nabble.documentfoundation.org/Grammar-checker-Undocumented-change-in-the-API-for-LO-4-td4030639.html
        if nStartOfSentencePos != 0:
            return xRes
        xRes.nStartOfNextSentencePosition = len(rText)
        # END OF PATCH

        # WORKAROUND FOR AVOIDING REPEATED ACTIONS ON HEAVY PARAGRAPHS
        if xRes.nStartOfNextSentencePosition > 3000:
            nHashedVal = hash(rText)
            if nHashedVal in self.dResult:
                return self.dResult[nHashedVal]
        # WORKAROUND ->>>

        xRes.nBehindEndOfSentencePosition = xRes.nStartOfNextSentencePosition

        try:
            xRes.aErrors = tuple(gce.parse(rText, rLocale.Country))
            # ->>> WORKAROUND
            if xRes.nStartOfNextSentencePosition > 3000:
                self.dResult[nHashedVal] = xRes
                self.nRes += 1
                if self.nRes > self.nMaxRes:
                    del self.dResult[self.lLastRes.popleft()]
                    self.nRes = self.nMaxRes
                self.lLastRes.append(nHashedVal)
            # END OF WORKAROUND
        except:
            traceback.print_exc()
        return xRes

    def ignoreRule (self, rid, aLocale):
        gce.ignoreRule(rid)

    def resetIgnoreRules (self):
        gce.resetIgnoreRules()

    # XServiceDisplayName
    def getServiceDisplayName (self, aLocale):
        return gce.name

    # Grammalecte
    def getSpellChecker (self):
        return gce.getSpellChecker()

    def loadUserDictionaries (self):
        try:
            xSettingNode = helpers.getConfigSetting("/org.openoffice.Lightproof_grammalecte/Other/", False)
            xChild = xSettingNode.getByName("o_fr")
            if xChild.getPropertyValue("use_personal_dic"):
                sJSON = xChild.getPropertyValue("personal_dic")
                if sJSON:
                    oSpellChecker = gce.getSpellChecker();
                    oSpellChecker.setPersonalDictionary(json.loads(sJSON))
        except:
            traceback.print_exc()

    def setWriterUnderliningStyle (self):
        try:
            xSettingNode = helpers.getConfigSetting("/org.openoffice.Lightproof_grammalecte/Other/", False)
            xChild = xSettingNode.getByName("o_fr")
            sLineType = xChild.getPropertyValue("line_type")
            bMulticolor = bool(xChild.getPropertyValue("line_multicolor"))
            gce.setWriterUnderliningStyle(sLineType, bMulticolor)
        except:
            traceback.print_exc()


g_ImplementationHelper = unohelper.ImplementationHelper()
g_ImplementationHelper.addImplementation(Grammalecte, "org.openoffice.comp.pyuno.Lightproof."+gce.pkg, ("com.sun.star.linguistic2.Proofreader",),)

# g_ImplementationHelper.addImplementation( opt_handler.LightproofOptionsEventHandler, \
#     "org.openoffice.comp.pyuno.LightproofOptionsEventHandler." + gce.pkg, ("com.sun.star.awt.XContainerWindowEventHandler",),)

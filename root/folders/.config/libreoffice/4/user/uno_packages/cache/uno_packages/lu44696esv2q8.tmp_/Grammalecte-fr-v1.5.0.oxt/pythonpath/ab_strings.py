# About strings

def getUI (sLang):
    if sLang in dStrings:
        return dStrings[sLang]
    return dStrings["fr"]

dStrings = {
    "fr": {
            "windowtitle": "À propos…",
            "title": "Grammalecte",
            "version": "Version : 1.5.0",
            "license": "Licence : GPL 3",
            "website": "Site web",

            "pythonver": "Python v",
            "console": "Console",

            "message": "Avec le soutien de",
            "sponsor": "La Mouette…",
            "sponsor2": "Algoo…",
            "link": "… et de nombreux contributeurs.",

            "close": "~OK"
          },
    "en": {
            "windowtitle": "About…",
            "title": "Grammalecte",
            "version": "Version: 1.5.0",
            "license": "License: GPL 3",
            "website": "Web site",

            "pythonver": "Python v",
            "console": "Console",

            "message": "With the support of",
            "sponsor": "La Mouette…",
            "sponsor2": "Algoo…",
            "link": "… and many contributors.",

            "close": "~OK"
          }
}

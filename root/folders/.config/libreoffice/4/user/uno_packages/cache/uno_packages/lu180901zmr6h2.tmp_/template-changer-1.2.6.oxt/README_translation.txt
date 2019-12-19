To help with translation of the TemplateChanger extension, you can do as follows:

- Open tc_l10n.ods and look for a table for your language
- if no such table exists, copy a existing table, rename it and type your language code in cell B1
- translate all missing strings in column D - Translated (lines with missing strings are marked yellow)
    do not translate names of variables ($file, $folder ...)
    "\n" will be converted to a newline
- review already translated strings
- send the entire document to me (andreschnabel@openoffice.org)

- to translate help, make a copy of the en-folder in help and name it according to your languga code .
- delete all but the *.xhp files
- translate text content of *.xhp (do not translate the XML tags or attributes)
- zip your help folder and send it to me (andreschnabel@openoffice.org)

- If you like you can translate the introduction of the license copyright info and add a link to a translated version of LGPL:

The author of this extension is:
    André Schnabel (andreschnabel@openoffice.org)
Copyright 2007, 2008. Some Rights reserverd.

This extension is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License version 3, as published by the Free Software Foundation.

This extension is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

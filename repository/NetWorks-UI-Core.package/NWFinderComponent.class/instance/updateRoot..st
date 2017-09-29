updating
updateRoot: anHtmlRoot
  | language |
  language := anHtmlRoot requestContext request
    at: 'lang'
    ifAbsent: [ anHtmlRoot requestContext request acceptLanguage first value language ].
  ElFinderFileLibrary default updateRoot: anHtmlRoot.
  anHtmlRoot javascript
    url: ElFinderFileLibrary / ('jsi18nelfinder' , language , 'Js') asSymbol
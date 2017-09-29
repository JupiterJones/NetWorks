api information
getApiInformationObjectForAppVersion: appVersion
  "Answer the api information object that supports the supplied app version"

  <get>
  <path: '/version?appVersion={appVersion}'>
  <produces: 'application/json'>
  | apis |
  apis := NetWorksAPI subclasses
    select: [ :apiClass | apiClass appVersions includes: appVersion ].
  ^ NetWorksAPICanvas builder
    render: [ :canvas | self renderInformationForApis: apis on: canvas ]
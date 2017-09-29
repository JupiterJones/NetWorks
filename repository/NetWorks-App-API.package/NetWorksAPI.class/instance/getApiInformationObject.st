api information
getApiInformationObject
  "Answer the api information object"

  <get>
  <path: '/version'>
  <produces: 'application/json'>
  | apis |
  GRPlatform current
    doTransaction: [ 
      (ObjectLogEntry
        info: 'NetWorks'
        object:
          {(WACurrentRequestContext value request copy).
          (WACurrentRequestContext value request authorization)})
        addToLog ].
  apis := NetWorksAPI subclasses.
  ^ NetWorksAPICanvas builder
    render: [ :canvas | self renderInformationForApis: apis on: canvas ]
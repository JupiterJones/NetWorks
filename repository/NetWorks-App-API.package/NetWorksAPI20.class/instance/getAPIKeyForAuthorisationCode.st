api calls
getAPIKeyForAuthorisationCode
  "Answer the api-key for this authorisation"

  <get>
  <path: '/verifyAuthorisationCode'>
  <produces: 'application/json'>
  | authorisation authCode apiKey organisation |
  GRPlatform current
    doTransaction: [ 
      (ObjectLogEntry
        info: 'NetWorks'
        object:
          {(WACurrentRequestContext value request copy).
          (WACurrentRequestContext value request headers).
          (WACurrentRequestContext value request authorization)})
        addToLog ].
  authCode := WACurrentRequestContext value request authorization readStream
    upTo: $:;
    upToEnd.
  (apiKey := NWModelRoot instance apiKeyForAuthCode: authCode)
    ifNil: [ 
      self requestContext response notFound.
      ^ self successResponse ].
  organisation := (self modelRoot apiKeys at: apiKey) user organisation.
  ^ NetWorksAPI20Canvas builder
    render: [ :canvas | 
      self
        renderApiKey: apiKey
        organisation: organisation title
        logo: organisation logoLarge url
        on: canvas ]
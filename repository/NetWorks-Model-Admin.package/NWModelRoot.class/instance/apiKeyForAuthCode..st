authorisations
apiKeyForAuthCode: authCode
  "Answer the apiKey from apiKeys or try to create if it doesn't exist. answer nil otherwise"

  | apiKey authorisation |
  (authorisation := self authorisationForCode: authCode) ifNil: [ ^ nil ].
  (self apiKeys includesKey: (apiKey := authorisation at: #'apiKey'))
    ifFalse: [ self apiKeys at: apiKey put: (authorisation at: #'contractor') ].
  ^ apiKey
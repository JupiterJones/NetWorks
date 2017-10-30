as yet unclassified
verifyRequest: aRequestContext
  | userName password |
  userName := aRequestContext request headers at: 'user'.
  password := aRequestContext request headers at: 'authorization'.
  password := password copyFrom: 7 to: password size.	" (ObjectLogEntry
    info: 'Auth Request: ' , (aRequestContext request at: 'x-original-url')
    object:
      {userName.
      password.
      (aRequestContext request headers)})
    addToLog."
  ^ userName = 'apiKey'
    ifTrue: [ self verifyApiKey: password requestContext: aRequestContext ]
    ifFalse: [ 
      (NWCurrentOrganisation value model users
        detect: [ :user | user userName = userName and: [ user cryptPassword = password ] ]
        ifNone: [ nil ]) notNil ]
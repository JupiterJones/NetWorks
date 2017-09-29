as yet unclassified
verifyRequest: aRequestContext
  | userName password |
  userName := aRequestContext request headers at: 'user'.
  password := aRequestContext request headers at: 'authorization'.
  password := password copyFrom: 7 to: password size.
  ^ userName = 'apiKey'
    ifTrue: [ self verifyApiKey: password requestContext: aRequestContext ]
    ifFalse: [ 
      (NWCurrentOrganisation value model users
        detect: [ :user | user userName = userName and: [ user cryptPassword = password ] ]
        ifNone: [ nil ]) notNil ]
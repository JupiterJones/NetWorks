handling
handleFiltered: aRequestContext
  | apiKey contractor |
  WACurrentRequestContext value request authorization
    ifNil: [ super handleFiltered: aRequestContext ]
    ifNotNil: [ :authorization | 
      (authorization startsWith: 'authCode')
        ifTrue: [ super handleFiltered: aRequestContext ]
        ifFalse: [ 
          apiKey := authorization readStream
            upTo: $:;
            upToEnd.
          NWCurrentContractor
            use: (contractor := self modelRoot apiKeys at: apiKey asLowercase)
            during: [ 
              NWCurrentOrganisation
                use: contractor user organisation
                during: [ super handleFiltered: aRequestContext ] ] ] ]
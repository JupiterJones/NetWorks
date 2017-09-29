handling
handleFiltered: aRequestContext
  (aRequestContext request url asString startsWith: '/NetWorksAdmin')
    ifTrue: [ super handleFiltered: aRequestContext ]
    ifFalse: [ 
      (NWModelRoot instance organisationWithDnsName: aRequestContext request host)
        useDuring: [ super handleFiltered: aRequestContext ] ]
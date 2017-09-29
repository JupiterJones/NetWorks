searching
organisationWithDnsName: aDnsName
  ^ organisations
    detect: [ :organisation | organisation dnsName = aDnsName ]
    ifNone: [ self error: 'No organisation found for "' , aDnsName asString , '"' ]
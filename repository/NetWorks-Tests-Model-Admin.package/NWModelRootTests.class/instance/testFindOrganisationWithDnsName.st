tests
testFindOrganisationWithDnsName
  | org result |
  org := NWOrganisation new
    title: 'Test Org';
    dnsName: 'test.org';
    yourself.
  model organisations add: org.
  result := model organisationWithDnsName: 'test.org'.
  self assert: org == result.
  self
    should: [ model organisationWithDnsName: 'unknown.dnsname.com' ]
    raise: Error
tests
testBadId
  | object id |
  object := NWIdentifiableObject new.
  self should: [ object id: 123 ] raise: Error
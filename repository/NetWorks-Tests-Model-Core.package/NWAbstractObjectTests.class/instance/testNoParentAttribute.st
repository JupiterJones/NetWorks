tests
testNoParentAttribute
  | object |
  object := NWAbstractObject new.
  self should: [ object parent ] raise: Error
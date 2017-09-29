tests
testBadAttribute
  | object |
  object := NWAbstractObject new.
  self should: [ object attributeAt: self stringDescription ] raise: Error
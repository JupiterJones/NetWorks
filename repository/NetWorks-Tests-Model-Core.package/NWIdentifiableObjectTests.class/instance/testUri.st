tests
testUri
  | object id |
  id := (object := NWIdentifiableObject new) id.
  self assert: (object uri isKindOf: WAUrl).
  self assert: object uri asString = ('/' , id asString36)
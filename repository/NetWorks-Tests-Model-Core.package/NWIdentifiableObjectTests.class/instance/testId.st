tests
testId
  | object |
  object := NWIdentifiableObject new.
  self assert: (object id isKindOf: UUID)
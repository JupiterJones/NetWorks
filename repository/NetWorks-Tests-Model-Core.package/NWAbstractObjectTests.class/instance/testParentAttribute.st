tests
testParentAttribute
  | object |
  object := NWAbstractObject new.
  object parent: #'DummyParent'.
  self assert: object parent == #'DummyParent'
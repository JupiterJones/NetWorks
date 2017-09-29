tests
testNewAttribute
  | object |
  object := NWAbstractObject new.
  object attributeAt: self stringDescription put: 'String Test'.
  self assert: (object attributeAt: self stringDescription) = 'String Test'
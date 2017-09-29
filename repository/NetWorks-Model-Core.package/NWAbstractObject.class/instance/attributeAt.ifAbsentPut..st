accessing-attributes
attributeAt: aDescription ifAbsentPut: absentBlock
  ^ (self attributeAt: aDescription)
    ifNil: [ self attributeAt: aDescription put: absentBlock value ]
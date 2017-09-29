accessing
uri
  ^ self attributeAt: 'uri' ifAbsentPut: [ self generateUri ]
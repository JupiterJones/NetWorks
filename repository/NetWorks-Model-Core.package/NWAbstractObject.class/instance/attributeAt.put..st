accessing-attributes
attributeAt: aDescription put: anObject
  (self attributes magritteDescription includes: aDescription)
    ifFalse: [ attributes magritteDescription add: aDescription ].
  attributes write: anObject using: aDescription.
  ^ anObject
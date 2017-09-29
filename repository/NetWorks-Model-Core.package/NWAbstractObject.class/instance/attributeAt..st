accessing-attributes
attributeAt: aDescription
  (self attributes magritteDescription includes: aDescription)
    ifFalse: [ ^ nil ].
  ^ attributes readUsing: aDescription
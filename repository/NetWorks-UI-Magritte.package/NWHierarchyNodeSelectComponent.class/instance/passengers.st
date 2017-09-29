accessing
passengers
  passengers isNil
    ifTrue: [ passengers := Dictionary new: 1000 ].
  ^ passengers
JSON
idForPassenger: anObject
  ^ self passengerIDs
    at: anObject
    ifAbsentPut: [ 
      | id |
      nextID := nextID isNil
        ifTrue: [ 1 ]
        ifFalse: [ nextID + 1 ].
      id := nextID printString.
      self passengers at: id put: anObject.
      id ]
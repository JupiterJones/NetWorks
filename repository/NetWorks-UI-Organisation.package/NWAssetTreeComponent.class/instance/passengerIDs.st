accessing
passengerIDs
  passengerIDs isNil
    ifTrue: [ passengerIDs := Dictionary new: 1000 ].
  ^ passengerIDs
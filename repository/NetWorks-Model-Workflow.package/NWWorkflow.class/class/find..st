defaults
find: statusTitle
  | status |
  status := initialStatus.
  [ 
  status title = statusTitle
    ifTrue: [ ^ status ]
    ifFalse: [ status := status next ].
  status isNil ]
    whileFalse.
  ^ nil
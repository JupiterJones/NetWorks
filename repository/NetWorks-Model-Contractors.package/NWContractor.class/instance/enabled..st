accessing
enabled: aBoolean
  user enabled: aBoolean.
  aBoolean
    ifTrue: [ self model users add: self user ]
    ifFalse: [ self model users remove: self user ifAbsent: [  ] ]
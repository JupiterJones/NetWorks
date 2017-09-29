accessing
atDepth: value
  "Answer the location at depth in ths locations hierarchy. If value > self-#depth answer nil"

  ^ value > self depth
    ifTrue: [ nil ]
    ifFalse: [ 
      value == self depth
        ifTrue: [ self ]
        ifFalse: [ parent atDepth: value ] ]
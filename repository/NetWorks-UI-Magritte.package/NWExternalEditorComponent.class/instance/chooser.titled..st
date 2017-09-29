calling
chooser: aComponent titled: aString
  self root
    show: aComponent yourself
    onAnswer: [ :result | 
      result isNil
        ifFalse: [ self value: result ] ]
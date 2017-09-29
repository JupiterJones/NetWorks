private
valueFrom: aString
  "Try to coerce to a number - else return nil"

  ^ (aString anySatisfy: [ :char | char isDigit ])
    ifFalse: [ nil ]
    ifTrue: [ (Number squeezeNumberOutOfString: aString) roundTo: 0.01 ]
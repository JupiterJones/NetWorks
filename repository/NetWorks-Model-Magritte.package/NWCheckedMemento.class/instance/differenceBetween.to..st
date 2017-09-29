private
differenceBetween: firstDictionary to: secondDictionary
  | changesDictionary firstValue secondValue |
  changesDictionary := Dictionary new.
  self magritteDescription
    do: [ :each | 
      (each isVisible and: [ each isReadonly not ])
        ifTrue: [ 
          firstValue := firstDictionary at: each ifAbsent: [ nil ].
          secondValue := secondDictionary at: each ifAbsent: [ nil ].
          firstValue = secondValue
            ifFalse: [ 
              changesDictionary
                at: each
                put:
                  {firstValue.
                  secondValue} ] ] ].
  ^ changesDictionary
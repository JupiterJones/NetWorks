actions
add
  | newObject |
  self memento commit.
  newObject := self selected new.
  (newObject respondsTo: #'backReference:')
    ifTrue: [ newObject backReference: self memento model ].
  self root
    show: (self validatedFormOn: newObject)
    onAnswer: [ :result | 
      result isNil
        ifFalse: [ 
          self
            value: (self value copyWith: result);
            refresh.
          self memento commit ] ]
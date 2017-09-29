accessing
children
  | children |
  children := Set withAll: super children.
  self components values
    do: [ :componentOrCollection | 
      children
        addAll:
          (componentOrCollection isCollection
            ifTrue: [ componentOrCollection ]
            ifFalse: [ {componentOrCollection} ]) ].
  ^ children
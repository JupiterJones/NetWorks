accessing
children
  | set |
  set := Set withAll: super children.
  self components values
    do: [ :componentOrCollection | 
      set
        addAll:
          (componentOrCollection isCollection
            ifTrue: [ componentOrCollection ]
            ifFalse: [ {componentOrCollection} ]) ].
  ^ set
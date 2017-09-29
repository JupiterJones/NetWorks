actions
remove: anObject
  anObject canBeDeleted
    ifFalse: [ self informWarning: anObject canNotBeDeletedErrorMessage ]
    ifTrue: [ 
      (self
        confirmError:
          'Are you sure you want to remove '
            ,
              (anObject readUsing: description reference children first) asString
            , '?')
        ifTrue: [ 
          self value: (self value copyWithout: anObject).
          self refresh.
          self memento commit.
          anObject cleanUpAfterDelete ] ]
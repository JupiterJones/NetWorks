actions
remove: anObject
  anObject canBeDeleted
    ifFalse: [ 
      (self
        confirmWarning:
          anObject canNotBeDeletedErrorMessage , ' Do you really want to remove it?')
        ifFalse: [ ^ self ] ].
  (self
    confirmError:
      'Are you sure you want to remove '
        , (anObject readUsing: description reference children first) asString
        , '?')
    ifTrue: [ 
      self value: (self value copyWithout: anObject).
      self refresh.
      self memento commit.
      anObject cleanUpAfterDelete ]
accessing
user: anObject
  user = anObject
    ifFalse: [ 
      user := anObject.
      user
        ifNil: [ 
          user notNil
            ifTrue: [ self announce: NWLoggedOut ] ]
        ifNotNil: [ self announce: NWLoggedIn ] ]
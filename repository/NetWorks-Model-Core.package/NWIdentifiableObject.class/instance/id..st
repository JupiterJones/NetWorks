private
id: aUUID
  (aUUID isKindOf: UUID)
    ifFalse: [ 
      ^ self
        error:
          'an id must be an instance of UUID. ' , aUUID printString
            , ' is not a valid id.' ].
  id := aUUID
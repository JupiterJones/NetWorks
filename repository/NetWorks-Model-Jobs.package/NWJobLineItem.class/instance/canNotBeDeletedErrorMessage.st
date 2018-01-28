magritte hooks
canNotBeDeletedErrorMessage
  | assignments |
  assignments := Set
    withAll: (self assignments collect: [ :assignment | assignment workOrder ]).
  ^ String
    streamContents: [ :stream | 
      stream
        nextPutAll:
          'This Line item as been assigned to ' , assignments size asString
            , ' work order'.
      assignments size > 1
        ifTrue: [ stream nextPut: $s ].
      stream nextPutAll: '.' ]
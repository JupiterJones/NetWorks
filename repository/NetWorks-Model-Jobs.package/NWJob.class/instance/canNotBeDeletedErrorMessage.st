magritte hooks
canNotBeDeletedErrorMessage
  ^ String
    streamContents: [ :stream | 
      stream nextPutAll: 'This Job contains '.
      lineItems isEmpty
        ifFalse: [ 
          stream
            nextPutAll: lineItems size asString;
            nextPutAll: ' Line Item'.
          lineItems size > 1
            ifTrue: [ stream nextPutAll: 's' ].
          workOrders isEmpty
            ifFalse: [ stream nextPutAll: ' and ' ] ].
      workOrders isEmpty
        ifFalse: [ 
          stream
            nextPutAll: workOrders size asString;
            nextPutAll: ' Work Order'.
          workOrders size > 1
            ifTrue: [ stream nextPutAll: 's' ] ].
      stream nextPutAll: '. It can not be deleted.' ]
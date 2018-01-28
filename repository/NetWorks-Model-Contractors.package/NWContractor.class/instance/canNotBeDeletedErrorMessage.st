errors
canNotBeDeletedErrorMessage
  | workOrders |
  ^ String
    streamContents: [ :stream | 
      stream
        nextPutAll: 'This Contractor has ';
        nextPutAll: (workOrders := self workOrders) size asString;
        nextPutAll: ' Work Order'.
      workOrders size > 1
        ifTrue: [ stream nextPutAll: 's' ].
      stream nextPutAll: '.' ]
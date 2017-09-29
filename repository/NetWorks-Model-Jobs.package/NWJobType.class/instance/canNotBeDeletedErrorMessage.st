magritte hooks
canNotBeDeletedErrorMessage
  ^ String
    streamContents: [ :stream | 
      stream
        nextPutAll: 'This Job Type contains ';
        nextPutAll: lineItemTypes size asString;
        nextPutAll: ' Line Item Type'.
      lineItemTypes size > 1
        ifTrue: [ stream nextPutAll: 's' ].
      stream nextPutAll: '. It can not be deleted.' ]
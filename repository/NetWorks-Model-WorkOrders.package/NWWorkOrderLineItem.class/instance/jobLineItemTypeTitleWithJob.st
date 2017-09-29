accessing
jobLineItemTypeTitleWithJob
  ^ String
    streamContents: [ :stream | 
      stream
        nextPutAll: self jobLineItem lineItemType title;
        nextPutAll: ' (';
        nextPutAll: self workOrder title;
        nextPutAll: ')' ]
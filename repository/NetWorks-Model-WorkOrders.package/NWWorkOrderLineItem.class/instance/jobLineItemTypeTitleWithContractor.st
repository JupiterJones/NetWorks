accessing
jobLineItemTypeTitleWithContractor
  ^ String
    streamContents: [ :stream | 
      stream
        nextPutAll:
            (self jobLineItem
                ifNotNil: [ :jobLineItem | jobLineItem lineItemType title ]
                ifNil: [ '<no job line item>' ]);
        nextPutAll: ' (';
        nextPutAll: self workOrder contractor title;
        nextPutAll: ')' ]
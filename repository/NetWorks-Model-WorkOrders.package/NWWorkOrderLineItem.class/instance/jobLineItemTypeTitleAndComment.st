accessing
jobLineItemTypeTitleAndComment
  ^ String
    streamContents: [ :stream | 
      stream
        nextPutAll:
            (self jobLineItem
                ifNotNil: [ :jobLineItem | jobLineItem lineItemType comment ]
                ifNil: [ '<no job line item comment>' ]);
        nextPutAll: ' (';
        nextPutAll: self jobLineItem lineItemType title;
        nextPutAll: ')' ]
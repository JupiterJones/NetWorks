descriptions
jobLineItemTypeTitleAndComment
  ^ String
    streamContents: [ :stream | 
      self jobLineItem
        ifNotNil: [ :jobLineItem | 
          stream
            nextPutAll: jobLineItem lineItemType comment;
            nextPutAll: ' (';
            nextPutAll: self jobLineItem lineItemType title;
            nextPutAll: ')' ]
        ifNil: [ stream nextPutAll: '<no job line item>' ] ]
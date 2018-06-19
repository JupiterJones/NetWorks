descriptions
lineItemTypeTitleAndComment
  ^ self lineItemType
    ifNil: [ 'Error: No Line ItemType. Please select one to continue.' ]
    ifNotNil: [ 
      String
        streamContents: [ :stream | 
          stream
            nextPutAll: self lineItemType comment;
            nextPutAll: ' (';
            nextPutAll: self lineItemType title;
            nextPutAll: ')' ] ]
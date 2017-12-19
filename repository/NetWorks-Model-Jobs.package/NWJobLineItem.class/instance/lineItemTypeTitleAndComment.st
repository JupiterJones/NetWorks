descriptions
lineItemTypeTitleAndComment
  ^ String
    streamContents: [ :stream | 
      stream
        nextPutAll: self lineItemType comment;
        nextPutAll: ' (';
        nextPutAll: self lineItemType title;
        nextPutAll: ')' ]
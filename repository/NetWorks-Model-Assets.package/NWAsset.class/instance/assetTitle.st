descriptions
assetTitle
  ^ String
    streamContents: [ :stream | 
      stream nextPutAll: self title.
      self address
        ifNotNil: [ 
          stream
            nextPutAll: ' - ';
            nextPutAll: self address ] ]
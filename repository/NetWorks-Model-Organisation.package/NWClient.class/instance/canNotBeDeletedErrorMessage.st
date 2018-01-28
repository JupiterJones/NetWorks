magritte hooks
canNotBeDeletedErrorMessage
  ^ String
    streamContents: [ :stream | 
      stream
        nextPutAll: 'This Client contains ';
        nextPutAll: self projects size asString;
        nextPutAll: ' Project'.
      self projects size > 1
        ifTrue: [ stream nextPutAll: 's' ].
      stream nextPutAll: '.' ]
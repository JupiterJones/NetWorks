magritte hooks
canNotBeDeletedErrorMessage
  ^ String
    streamContents: [ :stream | 
      stream
        nextPutAll: 'This Project contains ';
        nextPutAll: jobs size asString;
        nextPutAll: ' Job'.
      jobs size > 1
        ifTrue: [ stream nextPutAll: 's' ].
      stream nextPutAll: '.' ]
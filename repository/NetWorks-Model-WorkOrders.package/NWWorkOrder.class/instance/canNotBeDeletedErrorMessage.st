magritte hooks
canNotBeDeletedErrorMessage
  ^ String
    streamContents: [ :stream | 
      stream
        nextPutAll: 'This Work Order is already ';
        nextPutAll: self percentageComplete asString;
        nextPutAll: '% complete.' ]
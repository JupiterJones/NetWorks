accessing
jobSummary
  ^ String
    streamContents: [ :stream | 
      stream
        nextPutAll: jobType title;
        nextPutAll: ' @ ';
        nextPutAll:
            (location ifNil: [ '<unknown location>' ] ifNotNil: [ location locationTitle ]) ]
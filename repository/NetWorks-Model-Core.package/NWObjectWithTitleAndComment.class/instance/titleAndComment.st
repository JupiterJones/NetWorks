accessing
titleAndComment
  ^ String
    streamContents: [ :stream | 
      stream nextPutAll: title.
      (comment notNil and: [ comment notEmpty ])
        ifTrue: [ 
          stream
            nextPutAll: ' - ';
            nextPutAll: comment ] ]
pre-start document
preStartDocumentNameForDate: aDate
  ^ self preStartDocument
    ifNil: [ nil ]
    ifNotNil: [ :preStartDocument | 
      | baseDocumentNameStream |
      baseDocumentNameStream := ReadStream on: preStartDocument.
      String
        streamContents: [ :stream | 
          stream
            nextPutAll: (baseDocumentNameStream upTo: $.);
            nextPut: $-;
            nextPutAll: (aDate asStringUsingFormat: #(1 2 3 $- 1 1 $: false));
            nextPut: $.;
            nextPutAll: baseDocumentNameStream upToEnd ] ]
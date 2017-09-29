pre start documents
preStartDocumentForTodayExists
  "Answer if there is a document set, and that it exists"

  ^ self preStartDocumentNameForToday
    ifNil: [ false ]
    ifNotNil: [ self fileDirectory fileExists: self preStartDocumentNameForToday ]
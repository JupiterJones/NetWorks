private
analyseRawData
  "Make sure the last character in rawData is a CR"

  (rawData isKindOf: ByteArray)
    ifTrue: [ rawData := String withAll: rawData ].
  rawData last == Character cr
    ifFalse: [ rawData add: Character cr ]
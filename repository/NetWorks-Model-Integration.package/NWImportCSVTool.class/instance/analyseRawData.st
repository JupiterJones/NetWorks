private
analyseRawData
  "Make sure the last character in rawData is a CR"

  rawData last == Character cr charCode
    ifFalse: [ rawData add: Character cr charCode ]
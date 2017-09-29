lookup
customerWithName: aString
  ^ self model clients detect: [ :client | client title = aString ]
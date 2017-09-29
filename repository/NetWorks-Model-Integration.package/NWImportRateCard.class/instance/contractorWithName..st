lookup
contractorWithName: aString
  ^ self model contractors detect: [ :contractor | contractor title = aString ]
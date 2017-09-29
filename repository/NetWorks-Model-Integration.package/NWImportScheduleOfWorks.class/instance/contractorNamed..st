private
contractorNamed: name
  ^ self model contractors
    detect: [ :c | c title asUppercase = name asUppercase ]
    ifNone: [ self error: 'No contractor named ' , name asString ]
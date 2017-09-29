private
contractorsNamed: names
  "Answer a collection of one or more contractors listed in names and separated by a comma"

  ^ (names subStrings: $,)
    collect: [ :name | 
      self model contractors
        detect: [ :c | c title asUppercase = name trimBoth asUppercase ]
        ifNone: [ self error: 'No contractor named ' , name asString ] ]
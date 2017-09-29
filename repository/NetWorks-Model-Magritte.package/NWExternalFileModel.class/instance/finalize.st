private
finalize
  | directory |
  directory := self directory.
  directory exists
    ifTrue: [ 
      directory deleteFileNamed: self filename ifAbsent: [  ].
      directory entries isEmpty
        ifTrue: [ directory containingDirectory deleteDirectory: directory localName ] ].
  self initialize.
  location := nil
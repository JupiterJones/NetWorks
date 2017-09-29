components
finderComponent
  ^ self
    componentAt: #'finder'
    ifAbsentPut: [ 
      NWFinderComponent new
        baseDirectoryAlias: [ self model readUsing: self model titleDescription ];
        baseDirectory: [ self model user fileDirectory ];
        yourself ]
rendering
finderComponent
  ^ self
    componentAt: #'finder'
    ifAbsentPut: [ 
      NWFinderComponent new
        baseDirectoryAlias: [ self model readUsing: self model titleDescription ];
        baseDirectory: [ self model fileDirectory ];
        yourself ]
magritte hooks
hasChanged: changesDictionary
  "If the title has changed, update the URI"

  super hasChanged: changesDictionary.
  (changesDictionary at: self clientDescription ifAbsent: [ nil ])
    ifNotNil: [ :clientChanges | 
      clientChanges first
        ifNotNil: [ 
          NWAdmin
            rename:
              clientChanges first projectsDirectory pathString
                , GRPlatform current pathSeparator , self uri
            to:
              clientChanges last projectsDirectory pathString
                , GRPlatform current pathSeparator , self uri ] ]
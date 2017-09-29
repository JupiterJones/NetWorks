webdav
updateDirectoryNameFrom: oldName to: newName inDirectory: parentDirectory
  "If oldName is not nil, rename to newName. Otherwise create a directory with new name. If newName is nil, remove the directory"

  oldName
    ifNil: [ (parentDirectory directoryNamed: newName) assureExistence ]
    ifNotNil: [ 
      newName
        ifNil: [ (parentDirectory directoryNamed: oldName) recursiveDelete ]
        ifNotNil: [ 
          self
            rename: (parentDirectory directoryNamed: oldName) pathName
            to: (parentDirectory directoryNamed: newName) pathName	"System
            performOnServer:
              'mv ' , (parentDirectory directoryNamed: oldName) pathName , ' '
                , (parentDirectory directoryNamed: newName) pathName" ] ]
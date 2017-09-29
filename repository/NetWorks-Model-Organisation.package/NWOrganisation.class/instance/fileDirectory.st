file system
fileDirectory
  ^ (self parentDirectory directoryNamed: self uri) assureExistence
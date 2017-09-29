file system
fileDirectory
  ^ (self parentDirectory directoryNamed: self jobLineItem lineItemType uri)
    assureExistence
file system
recursiveDelete: fileDirectory
  System performOnServer: 'rm -Rf "' , fileDirectory pathString , '"'
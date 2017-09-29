file system
defaultBackupDirectory
  "Answer the backup directory"

  ^ (FileDirectory default directoryNamed: self defaultBackupDirectoryName)
    assureExistence
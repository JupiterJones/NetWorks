backup / restore
restore
  "Backup the object to file named backupName in directory"

  object := (PassiveObject
    newOnStream: (directory oldFileNamed: self backupFileName)) activate
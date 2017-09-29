backup / restore
backup
  "Backup the object to file named backupName in directory"

  directory
    newFileNamed: self backupFileName
    do: [ :file | PassiveObject passivate: object toStream: file ]
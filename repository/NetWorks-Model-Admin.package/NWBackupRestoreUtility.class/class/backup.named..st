backup
backup: anObject named: backupName
  ^ self
    backup: anObject
    named: backupName
    directory: self defaultBackupDirectory
backup
backup: anObject named: backupName directory: backupDirectory
  ^ self new
    object: anObject;
    backupName: backupName;
    directory: backupDirectory;
    backup
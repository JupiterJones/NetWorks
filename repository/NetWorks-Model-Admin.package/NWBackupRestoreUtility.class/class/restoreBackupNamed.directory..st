restore
restoreBackupNamed: backupName directory: directory
  ^ self new
    backupName: backupName;
    directory: directory;
    restore
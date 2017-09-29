backup / restore
restoreFromBackup: backupName
  "Restore the entire model from a disc backup"

  self instance: (NWBackupRestoreUtility restoreBackupNamed: backupName) object
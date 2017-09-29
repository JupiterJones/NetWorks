testing
testBackup
  | result |
  result := NWBackupRestoreUtility
    backup: self objectToBackup
    named: self backupFileName.
  self assert: (result directory fileExists: result backupFileName).
  self removeBackup: result.
  self deny: (result directory fileExists: result backupFileName)
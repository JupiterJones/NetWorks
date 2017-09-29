testing
testRestore
  | backupName backup testObject restore result |
  backupName := self backupFileName.
  backup := NWBackupRestoreUtility
    backup: (testObject := self objectToBackup)
    named: backupName.
  restore := NWBackupRestoreUtility restoreBackupNamed: backupName.
  result := restore object.
  self removeBackup: backup.
  self assert: (result at: #'testString') = (testObject at: #'testString').
  self assert: (result at: #'testInteger') = (testObject at: #'testInteger').
  self assert: (result at: #'testArray') = (testObject at: #'testArray').
  self
    assert:
      (result at: #'testObject') title = (testObject at: #'testObject') title.
  self
    assert:
      (result at: #'testObject') comment = (testObject at: #'testObject') comment
backup / restore
backups
  "Answer a collection of backups from disc"

  ^ self backupDirectory fileNamesMatching: '*.nwb'
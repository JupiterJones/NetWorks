accessing
backupFileName
  ^ (backupName endsWith: '.nwb')
    ifTrue: [ backupName ]
    ifFalse: [ backupName , '.nwb' ]
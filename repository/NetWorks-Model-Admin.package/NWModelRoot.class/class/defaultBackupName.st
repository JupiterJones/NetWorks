backup / restore
defaultBackupName
  | dateAndTime |
  dateAndTime := DateAndTime now.
  ^ String
    streamContents: [ :stream | 
      stream
        nextPutAll: 'NWModelRoot-';
        nextPutAll: dateAndTime dayOfMonth asString;
        nextPutAll: dateAndTime monthAbbreviation asString;
        nextPutAll: dateAndTime year asString;
        nextPut: $-;
        nextPutAll: (dateAndTime hour24 asString padded: #'left' to: 2 with: $0);
        nextPutAll: (dateAndTime minute asString padded: #'left' to: 2 with: $0);
        nextPutAll:
            (dateAndTime second rounded asString padded: #'left' to: 2 with: $0) ]
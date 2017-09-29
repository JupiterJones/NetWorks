testing
objectToBackup
  "Answer an object for testing backup and restore"

  ^ Dictionary new
    at: #'testString' put: 'Test String';
    at: #'testInteger' put: 12345;
    at: #'testArray' put: #(1 2 3 4 5);
    at: #'testObject'
      put:
        (NWObjectWithTitleAndComment new
            title: 'Test Title';
            comment: 'Test Comment';
            yourself);
    yourself
accessing
url
  ^ organisation
    ifNil: [ 
      WAUrl new
        host: 'nwadmin.dev';
        addToPath: 'files';
        addToPath: 'Users';
        addToPath: self uri;
        yourself ]
    ifNotNil: [ 
      WAUrl new
        host: organisation dnsName;
        addToPath: organisation uri;
        addToPath: 'Users';
        addToPath: self uri;
        yourself ]
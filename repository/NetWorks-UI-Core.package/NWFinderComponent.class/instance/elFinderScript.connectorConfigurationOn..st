rendering
elFinderScript: elFinderScript connectorConfigurationOn: canvas
  | volumeGroup |
  elFinderScript connector
    uploadTempPath: NWAdmin tempUploadDirectory pathString;
    addRoot:
        (volumeGroup := ElFinderVolumeGroup new
            id: '1';
            alias: (volumeGroupName ifNil: [ self model organisation title ]);
            yourself);
    addRoot:
        (volumeGroup
            addVolume:
              (ElFinderLocalFileSystem new
                id: '2';
                alias: self baseDirectoryAlias;
                osPath: self baseDirectory pathString;
                url: 'http://' , NWCurrentOrganisation value dnsName , '/server';
                yourself));
    debug: true
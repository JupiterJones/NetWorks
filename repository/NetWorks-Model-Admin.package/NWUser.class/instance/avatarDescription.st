descriptions
avatarDescription
  <magritteDescription>
  ^ MAFileDescription new
    accessor: #'avatar';
    label: 'Avatar Image';
    kind: NWExternalFileModel;
    componentClass: NWFileUploadComponent;
    propertyAt: 'locationLookupBlock' put: [ self avatarDirectory ];
    propertyAt: 'urlLookupBlock' put: [ self avatarUrl ];
    priority: 1100;
    yourself
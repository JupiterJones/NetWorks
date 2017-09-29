descriptions
logoLargeDescription
  <magritteDescription>
  ^ MAFileDescription new
    accessor: #'logoLarge';
    label: 'Large Logo';
    kind: NWExternalFileModel;
    componentClass: NWFileUploadComponent;
    propertyAt: 'locationLookupBlock' put: [ self brandDirectory ];
    propertyAt: 'urlLookupBlock' put: [ self brandUrl ];
    priority: 1100;
    yourself
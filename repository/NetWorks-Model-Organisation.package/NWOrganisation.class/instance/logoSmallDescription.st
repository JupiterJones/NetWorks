descriptions
logoSmallDescription
  <magritteDescription>
  ^ MAFileDescription new
    accessor: #'logoSmall';
    label: 'Small Logo';
    kind: NWExternalFileModel;
    componentClass: NWFileUploadComponent;
    propertyAt: 'locationLookupBlock' put: [ self brandDirectory ];
    propertyAt: 'urlLookupBlock' put: [ self brandUrl ];
    priority: 1000;
    yourself
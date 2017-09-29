descriptions
integrationDescription
  <magritteDescription>
  | description |
  description := MAToOneRelationDescription new
    accessor: #'integration';
    classes: (OrderedCollection withAll: NWIntegration subclasses);
    reference: NWIntegration new titleDescription asContainer;
    componentClass: NWExternalEditorComponent;
    label: 'Integration';
    group: 'Basics';
    propertyAt: #'icon' put: 'cogs';
    priority: 300;
    yourself.
  ^ description
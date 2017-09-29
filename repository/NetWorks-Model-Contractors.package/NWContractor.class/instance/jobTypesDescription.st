descriptions
jobTypesDescription
  <magritteDescription>
  ^ MAMultipleOptionDescription new
    accessor: #'jobTypes';
    label: 'Job Types';
    priority: 500;
    options: self model jobTypes;
    reference: NWJobType new titleDescription asContainer;
    componentClass: TBSMagritteCheckboxGroupComponent;
    yourself
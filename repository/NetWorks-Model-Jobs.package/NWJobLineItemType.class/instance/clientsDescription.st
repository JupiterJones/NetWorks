descriptions
clientsDescription
  <magritteDescription>
  ^ MAMultipleOptionDescription new
    accessor: #'clients';
    label: 'Clients';
    priority: 400;
    options: self model clients;
    reference: NWClient new titleDescription asContainer;
    componentClass: TBSMagritteCheckboxGroupComponent;
    yourself
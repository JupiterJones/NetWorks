descriptions
portDescription
  <magritteDescription>
  ^ MAStringDescription new
    accessor: #'port';
    label: 'Port';
    priority: 100;
    beRequired;
    requiredErrorMessage: 'Please provide a port number.';
    componentClass: TBSMagritteTextInputComponent;
    yourself
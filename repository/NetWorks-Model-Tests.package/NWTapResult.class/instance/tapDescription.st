descriptions
tapDescription
  <magritteDescription>
  ^ MAStringDescription new
    accessor: #'tap';
    label: 'Tap';
    priority: 100;
    beRequired;
    requiredErrorMessage: 'Please provide a tap title.';
    componentClass: TBSMagritteTextInputComponent;
    yourself
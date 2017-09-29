descriptions
titleDescription
  <magritteDescription>
  ^ MAStringDescription new
    accessor: #'title';
    label: 'Title';
    priority: 100;
    beRequired;
    requiredErrorMessage: 'Please provide a title.';
    componentClass: TBSMagritteTextInputComponent;
    yourself
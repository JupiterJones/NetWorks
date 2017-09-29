descriptions
validatedPasswordDescription
  <magritteDescription>
  ^ MAPasswordDescription new
    accessor: #'password';
    label: 'Password';
    priority: 500;
    beRequired;
    componentClass: MAVerifiedPasswordComponent;
    yourself
descriptions
userNameDescription
  <magritteDescription>
  ^ MAStringDescription new
    accessor: #'userName';
    label: 'Email Address (used for login)';
    priority: 100;
    beRequired;
    requiredErrorMessage: 'Please provide a user name.';
    componentClass: TBSMagritteTextInputComponent;
    yourself
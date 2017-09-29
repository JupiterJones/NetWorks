descriptions
passwordDescription
  "<magritteDescription>"

  ^ MAPasswordDescription new
    accessor: (MAChainAccessor accessors: #(#'user' #'password'));
    componentClass: TBSVerifiedPasswordComponent;
    label: 'Password';
    priority: 500;
    beRequired;
    yourself
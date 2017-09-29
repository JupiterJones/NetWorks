descriptions
clientTitleDescription
  "<magritteDescription>"

  ^ MAStringDescription new
    accessor: (MAChainAccessor accessors: #(#'client' #'title'));
    label: 'Client';
    priority: 100;
    beRequired;
    beReadonly;
    yourself
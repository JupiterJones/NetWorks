descriptions
contractorNameDescription
  "<magritteDescription>"

  ^ MAStringDescription new
    accessor: (MAChainAccessor accessors: #(#'contractor' #'title'));
    label: 'Contractor';
    priority: 100;
    beReadonly;
    yourself
descriptions
workOrderTitleDescription
  "<magritteDescription>"

  ^ MAStringDescription new
    accessor: (MAChainAccessor accessors: #(#'workOrder' #'title'));
    label: 'Work Order';
    priority: 300;
    beRequired;
    beReadonly;
    yourself
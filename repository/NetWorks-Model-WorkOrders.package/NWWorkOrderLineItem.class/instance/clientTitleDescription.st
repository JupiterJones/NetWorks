descriptions
clientTitleDescription
  "<magritteDescription>"

  ^ MAStringDescription new
    accessor:
        (MAChainAccessor accessors: #(#'workOrder' #'job' #'project' #'client' #'title'));
    label: 'Client';
    priority: 300;
    beRequired;
    beReadonly;
    yourself
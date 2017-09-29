descriptions
clientTitleDescription
  "<magritteDescription>"

  ^ MAStringDescription new
    accessor:
        (MAChainAccessor accessors: #(#'job' #'project' #'client' #'title'));
    label: 'Client';
    priority: 300;
    beRequired;
    beReadonly;
    yourself
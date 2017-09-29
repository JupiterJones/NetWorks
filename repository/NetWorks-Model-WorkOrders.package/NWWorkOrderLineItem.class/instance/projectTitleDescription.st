descriptions
projectTitleDescription
  "<magritteDescription>"

  ^ MAStringDescription new
    accessor:
        (MAChainAccessor accessors: #(#'workOrder' #'job' #'project' #'title'));
    label: 'Project';
    priority: 300;
    beRequired;
    beReadonly;
    yourself
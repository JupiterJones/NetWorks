descriptions
projectTitleDescription
  "<magritteDescription>"

  ^ MAStringDescription new
    accessor: (MAChainAccessor accessors: #(#'job' #'project' #'title'));
    label: 'Project';
    priority: 300;
    beRequired;
    beReadonly;
    yourself
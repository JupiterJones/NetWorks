descriptions
jobTypeTitleDescription
  "<magritteDescription>"

  ^ MAStringDescription new
    accessor: (MAChainAccessor accessors: #(#'job' #'jobType' #'title'));
    label: 'Job Type';
    priority: 300;
    beReadonly;
    yourself
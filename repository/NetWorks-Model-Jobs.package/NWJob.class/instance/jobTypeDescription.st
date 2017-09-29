descriptions
jobTypeDescription
  <magritteDescription>
  | template |
  template := NWJobType new.
  ^ MASingleOptionDescription new
    accessor: #'jobType';
    options: self model jobTypes;
    reference: template titleDescription asContainer;
    componentClass: TBSMagritteSelectListComponent;
    label: 'Job Type';
    priority: 300;
    beRequired;
    yourself
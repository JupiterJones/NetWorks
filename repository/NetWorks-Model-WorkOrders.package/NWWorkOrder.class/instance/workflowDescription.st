descriptions
workflowDescription
  <magritteDescription>
  | description |
  description := MASingleOptionDescription new
    accessor: #'workflow';
    options: NWWorkflow all;
    reference: NWWorkflow new titleDescription asContainer;
    label: 'Workflow';
    priority: 400;
    beRequired;
    yourself.
  ^ description
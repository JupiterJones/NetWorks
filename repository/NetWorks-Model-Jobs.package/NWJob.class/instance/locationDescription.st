descriptions
locationDescription
  <magritteDescription>
  | template |
  template := NWLocation new.
  ^ NWHierarchyDescription new
    accessor: #'location';
    default: self model locations first;
    reference: template titleDescription asContainer;
    hierarchyDownSelector: #'locations';
    hierarchyUpSelector: #'parent';
    nodeLabelBlock: [ :node | node title ];
    rootNode: self model locations first;
    label: 'Location';
    priority: 350;
    beSorted;
    yourself
descriptions
jobTypesDescription
  <magritteDescription>
  | template |
  template := NWJobType new.
  ^ NWToManyRelationDescription new
    accessor: #'jobTypes';
    classes: {NWJobType};
    reference: template titleDescription , template commentDescription;
    label: 'Job Types';
    priority: 100;
    beSorted;
    yourself
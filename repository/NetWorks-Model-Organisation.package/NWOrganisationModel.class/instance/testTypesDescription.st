descriptions
testTypesDescription
  <magritteDescription>
  | template |
  template := NWTestType new.
  ^ NWToManyRelationDescription new
    accessor: #'testTypes';
    classes: {NWTestType};
    reference: template titleDescription , template commentDescription;
    label: 'Test Types';
    priority: 100;
    beSorted;
    yourself
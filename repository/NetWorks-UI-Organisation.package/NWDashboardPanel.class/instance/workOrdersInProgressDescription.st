descriptions
workOrdersInProgressDescription
  | template |
  "<magritteDescription>"
  template := NWWorkOrder new.
  ^ NWToManyRelationDescription new
    accessor: #'workOrdersInProgress';
    classes: {NWWorkOrder};
    componentClass: NWMagritteOneToManyComponent;
    reference:
        template locationTitleDescription , template clientTitleDescription
            , template jobTypeTitleDescription
            , template contractorNameDescription;
    label: 'Work Orders in Progress';
    priority: 600;
    beSorted;
    beDefinitive;
    beReadonly;
    yourself
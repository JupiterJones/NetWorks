descriptions
workOrdersDescription
  | template |
  "<magritteDescription>"
  template := NWWorkOrder new.
  ^ NWToManyRelationDescription new
    accessor: #'workOrders';
    classes: {NWWorkOrder};
    cssClass: 'reportComponent';
    componentClass: NWMagritteOneToManyComponent;
    reference:
        template locationTitleDescription , template clientTitleDescription
            , template jobTypeTitleDescription
            , template scheduleDateDescription;
    label: 'Work Orders';
    priority: 600;
    beSorted;
    beDefinitive;
    yourself
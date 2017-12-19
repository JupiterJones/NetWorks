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
        template titleDescription , template clientTitleDescription
            , template scheduleDateDescription
            , template percentageCompleteDescription;
    label: 'Work Orders';
    priority: 600;
    beSorted;
    beDefinitive;
    yourself
components
workOrdersComponent
  | template |
  template := NWWorkOrder new.
  ^ self components
    at: #'workOrderList'
    ifAbsentPut: [ 
      NWGenericPanelComponent new
        icon: #'fontAwesomeWrenchIcon';
        title: 'WorkOrders';
        wrapperClass: 'workOrderList';
        dropScope: 'workOrder';
        items:
            (self project jobs
                ifEmpty: [ #() ]
                ifNotEmpty: [ self project jobs first workOrders ]);
        rowClass: 'cal-drop';
        addFilter:
            (NWGenericPanelFilter new
                label: 'All';
                filterBlock: [ :job | true ];
                yourself);
        addFilter:
            (NWGenericPanelFilter new
                label: 'Unscheduled';
                filterBlock: [ :workOrder | workOrder isScheduled ];
                isExclusive: false;
                yourself);
        reportColumns:
            template titleDescription , template contractorNameOrUnassignedDescription
                , template percentageCompleteDescription;
        subscribe: NWObjectsSelected
          do: [ :ann | self workOrdersSelected: ann ]
          for: self;
        subscribe: NWObjectsDeleted
          do: [ :ann | self workOrdersDeleted: ann ]
          for: self;
        enableDraggableToScopes: #('calendar');
        yourself ]
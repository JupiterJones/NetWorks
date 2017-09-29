components
workOrderLineItemsComponent
  | template items |
  template := NWWorkOrderLineItem new.
  items := OrderedCollection new.
  self project jobs
    ifNotEmpty: [ :jobs | 
      jobs first workOrders
        ifNotEmpty: [ :workOrders | items := workOrders first lineItems ] ].
  ^ self components
    at: #'workOrderLineItems'
    ifAbsentPut: [ 
      NWGenericPanelComponent new
        icon: #'fontAwesomeWrenchIcon';
        title: 'Work Order Line Items';
        wrapperClass: 'workOrderLineItems';
        items: items;
        rowClass: 'cal-drop';
        addFilter:
            (NWGenericPanelFilter new
                label: 'All';
                filterBlock: [ :job | true ];
                yourself);
        reportColumns:
            template jobLineItemTypeTitleWithContractorDescription
                , template jobLineItemTypeCommentDescription
                , template quantityDescription
                , template quantityCompleteDescription;
        subscribe: NWObjectsSelected
          do: [ :ann | self workOrderLineItemsSelected: ann ]
          for: self;
        subscribe: NWObjectsDeleted
          do: [ :ann | self workOrderLineItemsDeleted: ann ]
          for: self;
        enableDraggableToScopes: #('calendar');
        yourself ]
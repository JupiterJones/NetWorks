components
jobLineItemsComponent
  | template |
  template := NWJobLineItem new.
  ^ self components
    at: #'jobLineItems'
    ifAbsentPut: [ 
      NWGenericPanelComponent new
        icon: #'fontAwesomeBriefcaseIcon';
        title: 'Job Line Items';
        wrapperClass: 'jobLineItems';
        items:
            (self project jobs
                ifEmpty: [ #() ]
                ifNotEmpty: [ self project jobs first lineItems ]);
        addFilter:
            (NWGenericPanelFilter new
                label: 'All';
                filterBlock: [ :job | true ];
                yourself);
        reportColumns:
            template lineItemTypeTitleDescription , template lineItemTypeCommentDescription
                , template quantityDescription
                , template quantityAssignedDescription
                , template quantityCompleteDescription;
        subscribe: NWObjectsSelected
          do: [ :ann | self jobLineItemsSelected: ann ]
          for: self;
        subscribe: NWObjectsClicked
          do: [ :ann | self jobLineItemsClicked: ann ]
          for: self;
        subscribe: NWObjectsDoubleClicked
          do: [ :ann | self jobLineItemsDoubleClicked: ann ]
          for: self;
        enableDraggableToScopes: #('contractor');
        yourself ]
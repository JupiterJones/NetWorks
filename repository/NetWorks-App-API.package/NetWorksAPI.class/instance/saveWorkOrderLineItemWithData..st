api information
saveWorkOrderLineItemWithData: data
  | job workOrder lineItem lineItemType quantity complete |
  job := NWCurrentOrganisation value model
    jobWithId: (UUID fromString: ((data at: #'identifiers') at: 'jobId')).
  workOrder := job
    workOrderWithId:
      (UUID fromString: ((data at: #'identifiers') at: 'workOrderId')).
  lineItemType := workOrder job jobType
    lineItemTypeWithId:
      (UUID fromString: ((data at: #'identifiers') at: 'lineItemTypeId')).
  quantity := (data at: #'data') at: 'quantity'.
  complete := (data at: #'data') at: 'complete'.
  lineItem := (workOrder
    lineItemWithId:
      (UUID fromString: ((data at: #'identifiers') at: 'lineItemId')))
    ifNil: [ 
      "This is a new LineItem"
      workOrder lineItems
        add:
          (NWWorkOrderLineItem new
            id: (UUID fromString: ((data at: #'identifiers') at: 'lineItemId'));
            workOrder: workOrder;
            jobLineItem:
                (workOrder job lineItems
                    add:
                      (NWJobLineItem new
                        job: job;
                        lineItemType: lineItemType;
                        yourself));
            yourself) ].
  lineItem
    quantity: quantity;
    quantityComplete: complete.
  lineItem jobLineItem quantity: quantity.
  lineItem jobLineItem lineItemType ~~ lineItemType
    ifTrue: [ lineItem jobLineItem lineItemType: lineItemType ].
  self saveWorkOrderLineItem: lineItem tests: ((data at: #'data') at: 'tests')
api information
putWorkOrderLineItemJobId: jobId workOrder: workOrderId lineItem: lineItemId lineItemType: lineItemTypeId quantity: quantityString complete: completeString
  "Update the line item with the new values"

  <put>
  <path:
    '/putWorkOrderLineItem?job={jobId}&workOrder={workOrderId}&lineItem={lineItemId}&lineItemType={lineItemTypeId}&quantity={quantityString}&complete={completeString}'>
  <produces: 'application/json'>
  | data job workOrder lineItem lineItemType quantity complete |
  data := Dictionary new.
  data
    at: #'job' put: jobId;
    at: #'workOrderId' put: workOrderId;
    at: #'lineItemId' put: lineItemId;
    at: #'lineItemTypeId' put: lineItemTypeId;
    at: #'quantity' put: quantityString;
    at: #'complete' put: completeString.
  quantity := Number squeezeNumberOutOfString: quantityString.
  complete := Number squeezeNumberOutOfString: completeString.
  job := NWCurrentOrganisation value model jobWithId: (UUID fromString: jobId).
  workOrder := job workOrderWithId: (UUID fromString: workOrderId).
  lineItemType := workOrder job jobType
    lineItemTypeWithId: (UUID fromString: lineItemTypeId).
  lineItem := (workOrder lineItemWithId: (UUID fromString: lineItemId))
    ifNil: [ 
      "This is a new LineItem"
      workOrder lineItems
        add:
          (NWWorkOrderLineItem new
            id: (UUID fromString: lineItemId);
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
  GRPlatform current
    doTransaction: [ (ObjectLogEntry info: 'NetWorks - putWorkOrderLineItem' object: data) addToLog ].
  ^ NetWorksAPICanvas builder
    render: [ :canvas | canvas object: [ canvas key: 'success' value: true ] ]
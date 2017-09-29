actions
workOrderLineItemsDeleted: ann
  "Confirm and delete the objects"

  ann objects
    do: [ :workOrderLineItem | 
      workOrderLineItem canBeDeleted
        ifTrue: [ 
          workOrderLineItem workOrder lineItems remove: workOrderLineItem.
          workOrderLineItem cleanUpAfterDelete ] ].
  self workOrderLineItemsComponent
    updateItems:
        (self workOrdersComponent reportComponent selectedItems
            inject: OrderedCollection new
            into: [ :result :workOrder | result , workOrder lineItems ]);
    clearSelection.
  self
    renderJobLineItemsOnScript: ann script;
    renderWorkOrderLineItemsOnScript: ann script
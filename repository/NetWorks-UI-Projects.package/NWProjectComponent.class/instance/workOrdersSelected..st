actions
workOrdersSelected: ann
  "When one or more workOrders are selected...
1. update the line items."

  self workOrderLineItemsComponent
    updateItems:
      (ann objects
        inject: OrderedCollection new
        into: [ :result :workOrder | result , workOrder lineItems ]).
  self
    focusWorkOrdersOnScript: ann script;
    renderWorkOrderLineItemsOnScript: ann script
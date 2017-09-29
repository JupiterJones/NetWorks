actions
workOrdersDeleted: ann
  "Confirm and delete the work orders"

  ann objects
    do: [ :workOrder | 
      workOrder canBeDeleted
        ifTrue: [ 
          workOrder job workOrders remove: workOrder.
          workOrder cleanUpAfterDelete ] ].
  self refreshWorkOrdersFocusOnScript: ann script
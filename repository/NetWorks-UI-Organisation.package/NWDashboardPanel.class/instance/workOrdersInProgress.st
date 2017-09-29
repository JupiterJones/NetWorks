accessing
workOrdersInProgress
  ^ self model allWorkOrders
    select: [ :workOrder | workOrder workflow == NWWorkflow startedStatus ]
accessing
workOrdersCompleted
  ^ self model allWorkOrders
    select: [ :workOrder | workOrder workflow == NWWorkflow completedStatus ]
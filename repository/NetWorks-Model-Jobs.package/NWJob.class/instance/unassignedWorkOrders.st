testing
unassignedWorkOrders
  ^ workOrders select: [ :workOrder | workOrder contractor isNil ]
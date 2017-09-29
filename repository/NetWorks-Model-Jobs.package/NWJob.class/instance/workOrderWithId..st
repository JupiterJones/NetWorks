convenience
workOrderWithId: uuid
  ^ workOrders detect: [ :workOrder | workOrder id = uuid ] ifNone: [ nil ]
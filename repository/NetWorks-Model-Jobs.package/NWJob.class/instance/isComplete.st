testing
isComplete
  ^ workOrders allSatisfy: [ :workOrder | workOrder isComplete ]
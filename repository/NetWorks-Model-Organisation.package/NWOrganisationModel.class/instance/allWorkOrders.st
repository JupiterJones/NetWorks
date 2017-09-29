convenience
allWorkOrders
  ^ self allJobs
    inject: Set new
    into: [ :allWorkOrders :job | 
      allWorkOrders
        addAll: job workOrders;
        yourself ]
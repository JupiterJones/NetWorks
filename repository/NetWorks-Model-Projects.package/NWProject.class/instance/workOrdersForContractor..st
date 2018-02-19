accessing
workOrdersForContractor: contractor
  "answer the collection of work orders for contractor"

  | workOrders |
  workOrders := OrderedCollection new.
  jobs
    do: [ :job | 
      workOrders
        addAll:
          (job workOrders select: [ :workOrder | workOrder contractor == contractor ]) ].
  ^ workOrders
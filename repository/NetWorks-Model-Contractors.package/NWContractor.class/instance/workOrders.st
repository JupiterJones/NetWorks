accessing
workOrders
  | workOrders |
  "Return the work orders for this contractor"
  workOrders := OrderedCollection new.
  user organisation model projects
    do: [ :project | 
      project jobs
        do: [ :job | 
          workOrders
            addAll:
              (job workOrders select: [ :workOrder | workOrder contractor == self ]) ] ].
  ^ workOrders
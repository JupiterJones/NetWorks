accessing
assignments
  "Answer the collection of workOrderLineItems refering to this jobLineItem"

  | assignments |
  assignments := OrderedCollection new.
  self job workOrders
    do: [ :workOrder | 
      assignments
        addAll:
          (workOrder lineItems
            select: [ :workOrderLineItem | workOrderLineItem jobLineItem == self ]) ].
  ^ assignments
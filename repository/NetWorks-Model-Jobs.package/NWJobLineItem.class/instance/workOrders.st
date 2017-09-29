accessing
workOrders
  "Answer the collection of workOrders with lineItems refering to this jobLineItem"

  | workOrders |
  workOrders := OrderedCollection new.
  self job workOrders
    do: [ :workOrder | 
      (workOrder lineItems
        detect: [ :workOrderLineItem | workOrderLineItem jobLineItem == self ]
        ifNone: [ nil ]) ifNotNil: [ workOrders add: workOrder ] ].
  ^ workOrders
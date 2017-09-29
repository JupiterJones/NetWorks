accessing
percentageComplete
  | numberOfTasks numberOfCompletedTasks |
  "Answer the percentage of job line items quantity to work order line items quantity complete."
  numberOfTasks := numberOfCompletedTasks := 0.
  lineItems
    do: [ :lineItem | numberOfTasks := numberOfTasks + lineItem quantity ].
  workOrders
    do: [ :workOrder | 
      workOrder lineItems
        do: [ :lineItem | numberOfCompletedTasks := numberOfCompletedTasks + lineItem quantityComplete ] ].
  numberOfTasks == 0
    ifTrue: [ ^ 0 ].
  ^ numberOfCompletedTasks / numberOfTasks * 100 asScaledDecimal: 1
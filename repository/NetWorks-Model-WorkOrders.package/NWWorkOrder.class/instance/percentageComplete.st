accessing
percentageComplete
  | numberOfTasks numberOfCompletedTasks |
  "Answer the percentage of tasks complete."
  numberOfTasks := numberOfCompletedTasks := 0.
  lineItems
    do: [ :lineItem | 
      numberOfTasks := numberOfTasks + lineItem quantity.
      numberOfCompletedTasks := numberOfCompletedTasks
        + lineItem quantityComplete ].
  numberOfTasks == 0
    ifTrue: [ ^ 0 ].
  ^ numberOfCompletedTasks / numberOfTasks * 100 asScaledDecimal: 1
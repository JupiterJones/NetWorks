accessing
quantityComplete
  | complete |
  complete := 0.
  self assignments
    do: [ :workOrderLineItem | complete := complete + workOrderLineItem quantityComplete ].
  ^ complete
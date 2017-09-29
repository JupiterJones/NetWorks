accessing
quantityAssigned
  | assigned |
  assigned := 0.
  self assignments
    do: [ :workOrderLineItem | assigned := assigned + workOrderLineItem quantity ].
  ^ assigned
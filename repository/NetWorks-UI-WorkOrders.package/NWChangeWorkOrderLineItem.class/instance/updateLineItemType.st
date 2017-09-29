actions
updateLineItemType
  "Create a new jobLineItem. 
Create a new workOrderLineItem.
Add it to the work order.
Remove the old line item from work order.
"

  | newLineItem |
  newLineItem := lineItem changeTypeTo: newLineItemType.
  self answer: newLineItem
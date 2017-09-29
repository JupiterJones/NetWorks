updating
changeTypeTo: newLineItemType
  "Create new jobLineItem referencing the old jobLineItem in previousLineItem.
remove the old lineItem from the job.
add the new lineItem to the job.
remove the old work order lineItem.
add the new workOrder lineItem.
answer passing the new work order lineItem"

  | newJobLineItem newWorkOrderLineItem |
  newJobLineItem := jobLineItem copy
    lineItemType: newLineItemType;
    previousLineItem: jobLineItem;
    yourself.
  newWorkOrderLineItem := self copy
    jobLineItem: newJobLineItem;
    yourself.
  workOrder job lineItems remove: jobLineItem.
  workOrder job lineItems add: newJobLineItem.
  workOrder lineItems remove: self.
  workOrder lineItems add: newWorkOrderLineItem.
  ^ newWorkOrderLineItem
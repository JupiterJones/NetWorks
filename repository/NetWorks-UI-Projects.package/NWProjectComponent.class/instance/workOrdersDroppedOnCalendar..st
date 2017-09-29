actions
workOrdersDroppedOnCalendar: ann
  "When one or more workOrder or workOrderLineItem are dropped on the calendar..."

  | droppedObjects |
  droppedObjects := self workOrdersComponent reportComponent selectedItems
    ifEmpty: [ ann objects ].
  droppedObjects do: [ :workOrder | workOrder scheduleDate: ann targetObject ].
  self refreshCalendarOnScript: ann script
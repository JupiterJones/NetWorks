scripts
refreshWorkOrdersFocusOnScript: script
  | workOrders |
  workOrders := workOrderFocus reportComponent selectedItems
    inject: OrderedCollection new
    into: [ :result :objectWithWorkOrders | result , objectWithWorkOrders workOrders ].
  self workOrdersComponent
    updateItems: workOrders;
    clearSelection.
  self workOrderLineItemsComponent
    updateItems: #();
    clearSelection.
  self calendarComponent events: workOrders.
  self renderJobLineItemsOnScript: script.
  self renderWorkOrdersOnScript: script.
  self renderWorkOrderLineItemsOnScript: script.
  self refreshCalendarOnScript: script
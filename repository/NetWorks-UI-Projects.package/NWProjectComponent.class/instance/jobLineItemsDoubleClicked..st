actions
jobLineItemsDoubleClicked: ann
  "When one or more job line items are double clicked show the work orders that reference this line item"

  | workOrders workOrderLineItems |
  workOrderFocus := self jobLineItemsComponent.
  workOrders := ann objects
    inject: OrderedCollection new
    into: [ :result :workOrderLineItem | result , workOrderLineItem workOrders ].
  self workOrdersComponent updateItems: workOrders.
  self workOrderLineItemsComponent
    updateItems:
      (ann objects
        inject: OrderedCollection new
        into: [ :result :workOrderLineItem | result , workOrderLineItem assignments ]).
  self calendarComponent events: workOrders.
  self
    renderWorkOrdersOnScript: ann script;
    renderWorkOrderLineItemsOnScript: ann script;
    refreshCalendarOnScript: ann script
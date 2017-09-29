actions
jobsSelected: ann
  "When one or more jobs are selected...
1. update the job line items.
2. update the work orders.
3. set the focus to be on the jobs panel"

  | workOrders workOrderLineItems |
  self jobLineItemsComponent
    updateItems:
      (ann objects
        inject: OrderedCollection new
        into: [ :result :job | result , job lineItems ]).
  self workOrdersComponent
    updateItems:
      (workOrders := ann objects
        inject: OrderedCollection new
        into: [ :result :job | result , job workOrders ]).
  workOrderLineItems := OrderedCollection new.
  ann objects
    ifNotEmpty: [ :jobs | 
      jobs first workOrders
        ifNotEmpty: [ :workOrders | workOrderLineItems := workOrders first lineItems ] ].
  self workOrderLineItemsComponent updateItems: workOrderLineItems.
  self calendarComponent events: workOrders.
  self
    focusJobsOnScript: ann script;
    renderJobLineItemsOnScript: ann script;
    renderWorkOrdersOnScript: ann script;
    renderWorkOrderLineItemsOnScript: ann script;
    refreshCalendarOnScript: ann script	"renderJobsOnScript: ann script;"
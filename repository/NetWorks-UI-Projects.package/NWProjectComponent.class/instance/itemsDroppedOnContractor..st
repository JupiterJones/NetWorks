actions
itemsDroppedOnContractor: ann
  "When one or more jobs or job lineItems are dropped on a contractor
1. Create (or find) work orders representing the jobs.
2. Create (or find) work order line items representing the job line items.
3. update the work orders list.
4. update the work order line items list"

  | droppedJobs droppedLineItems workOrders contractors |
  (ann objects first isKindOf: NWJob)
    ifTrue: [ 
      droppedJobs := self jobListComponent reportComponent selectedItems
        ifEmpty: [ ann objects ] ]
    ifFalse: [ 
      droppedLineItems := self jobLineItemsComponent reportComponent selectedItems
        ifEmpty: [ ann objects ] ].
  contractors := self contractorsComponent reportComponent selectedItems
    ifEmpty: [ OrderedCollection with: ann targetObject ].
  self
    ensureWorkOrdersWithJobs: droppedJobs
    lineItems: droppedLineItems
    contractors: contractors.
  self refreshWorkOrdersFocusOnScript: ann script
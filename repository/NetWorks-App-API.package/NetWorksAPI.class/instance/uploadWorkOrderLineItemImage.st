api information
uploadWorkOrderLineItemImage
  "Add a new image to the line item's work order's completion documents"

  <post>
  <path: '/uploadWorkOrderLineItemImage'>
  <consumes: 'application/x-www-form-urlencoded'>
  <produces: 'application/json'>
  | request fields lineItem image job workOrder fileBytes |
  request := self requestContext request.
  fields := request fields.
  job := workOrder := lineItem := nil.
  GRPlatform current
    doTransaction: [ 
      (ObjectLogEntry
        info: 'NetWorks - postWorkOrderLineItemImage'
        object:
          (Dictionary new
            at: #'fields' put: fields;
            at: #'job' put: job;
            at: #'workOrder' put: workOrder;
            at: #'lineItem' put: lineItem;
            yourself))
        addToLog ].
  ^ NetWorksAPICanvas builder
    render: [ :canvas | canvas object: [ canvas key: 'success' value: true ] ]
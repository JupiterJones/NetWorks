api information
deleteWorkOrderLineItemImage
  "Add a new image to the line item's work order's completion documents"

  <delete>
  <path: '/postWorkOrderLineItemImage'>
  <produces: 'application/json'>
  | request lineItem imageName job workOrder result |
  request := self requestContext request.
  job := NWCurrentOrganisation value model
    jobWithId: (UUID fromString: (request at: 'job')).
  workOrder := job workOrderWithId: (UUID fromString: (request at: 'workOrder')).
  lineItem := workOrder
    lineItemWithId: (UUID fromString: (request at: 'lineItem')).
  imageName := request at: 'imageName'.
  result := (lineItem fileDirectory deleteFileNamed: imageName ifAbsent: [ nil ])
    notNil.
  ^ NetWorksAPICanvas builder
    render: [ :canvas | canvas object: [ canvas key: 'success' value: result ] ]
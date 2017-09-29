api information
postWorkOrderLineItemImage
  "Add a new image to the line item's work order's completion documents"

  <post>
  <path: '/postWorkOrderLineItemImage'>
  <produces: 'application/json'>
  | request lineItem uploadedFile job workOrder |
  request := self requestContext request.
  job := NWCurrentOrganisation value model
    jobWithId: (UUID fromString: (request at: 'job')).
  workOrder := job workOrderWithId: (UUID fromString: (request at: 'workOrder')).
  lineItem := workOrder
    lineItemWithId: (UUID fromString: (request at: 'lineItem')).
  uploadedFile := request at: 'file'.
  lineItem fileDirectory
    forceNewFileNamed: uploadedFile fileName
    do: [ :file | 
      file binary.
      file nextPutAll: uploadedFile rawContents.
      file close ].
  GRPlatform current
    doTransaction: [ 
      (ObjectLogEntry
        info: 'NetWorks - postWorkOrderLineItemImage'
        object:
          (Dictionary new
            at: #'file' put: uploadedFile;
            at: #'job' put: job;
            at: #'workOrder' put: workOrder;
            at: #'lineItem' put: lineItem;
            yourself))
        addToLog ].
  ^ NetWorksAPICanvas builder
    render: [ :canvas | canvas object: [ canvas key: 'success' value: true ] ]
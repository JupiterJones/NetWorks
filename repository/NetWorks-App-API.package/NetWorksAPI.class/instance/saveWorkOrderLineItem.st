api information
saveWorkOrderLineItem
  "Update the line item with the new values"

  <put>
  <path: '/saveWorkOrderLineItem'>
  <consumes: 'application/json'>
  <produces: 'application/json'>
  | data job workOrder lineItem lineItemType quantity complete |
  data := Dictionary new.
  data
    at: #'identifiers'
    put:
      (WAJsonParser
        parse: (WACurrentRequestContext value request bodyDecodeUsing: 'utf-8')).
  data
    at: #'data'
    put: (WAJsonParser parse: ((data at: #'identifiers') at: 'data')).
  self saveWorkOrderLineItemWithData: data.
  GRPlatform current
    doTransaction: [ (ObjectLogEntry info: 'NetWorks - saveWorkOrderLineItem' object: data) addToLog ].
  ^ NetWorksAPICanvas builder
    render: [ :canvas | canvas object: [ canvas key: 'success' value: true ] ]
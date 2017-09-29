api information
getWorkOrders
  "Answer the set of work orders for this contractor"

  <get>
  <path: '/workOrders'>
  <produces: 'application/json'>
  | apiKey contractor |
  apiKey := WACurrentRequestContext value request authorization readStream
    upTo: $:;
    upToEnd.
  contractor := self modelRoot apiKeys at: apiKey asLowercase.
  ^ NetWorksAPICanvas builder
    render: [ :canvas | self renderWorkOrdersForContractor: contractor on: canvas ]
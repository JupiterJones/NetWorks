model object
workOrder: workOrder
  self
    object: [ 
      self
        key: 'id' value: workOrder id asString;
        key: 'title' value: workOrder title;
        key: 'comment' value: workOrder comment;
        key: 'job' value: [ self job: workOrder job ];
        key: 'workflow' value: workOrder workflow title;
        key: 'uri' value: workOrder uri;
        key: 'hasPreStart' value: workOrder preStartDocumentForTodayEists;
        key: 'preStartDocumentNameForToday'
          value: workOrder preStartDocumentNameForToday;
        key: 'numberOfLineItems' value: workOrder lineItems size;
        key: 'lineItems'
          value: [ 
              self
                array: [ 
                  workOrder lineItems
                    do: [ :workOrderLineItem | self workOrderLineItem: workOrderLineItem ] ] ] ]
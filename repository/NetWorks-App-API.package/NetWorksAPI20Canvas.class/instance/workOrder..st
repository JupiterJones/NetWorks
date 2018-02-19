model object
workOrder: workOrder
  self
    object: [ 
      self
        key: 'id' value: workOrder id asString;
        key: 'title' value: workOrder title;
        key: 'comment' value: workOrder comment;
        key: 'job' value: [ self job: workOrder job ];
        key: 'lineItems'
          value: [ 
              self
                array: [ 
                  workOrder lineItems
                    do: [ :workOrderLineItem | self workOrderLineItem: workOrderLineItem ] ] ] ]
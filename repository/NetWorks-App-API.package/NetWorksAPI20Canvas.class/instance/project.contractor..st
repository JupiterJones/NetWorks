model object
project: project contractor: contractor
  self
    object: [ 
      self
        key: 'id' value: project id asString;
        key: 'title' value: project title;
        key: 'comment' value: project comment;
        key: 'client' value: [ self client: project client ];
        key: 'workOrders'
          value: [ 
              self
                array: [ 
                  (project workOrdersForContractor: contractor)
                    do: [ :workOrder | self workOrder: workOrder ] ] ] ]
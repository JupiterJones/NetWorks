rendering
renderWorkOrdersForContractor: contractor on: canvas
  "Render the Contractor workOrders"

  canvas
    object: [ 
      canvas name: 'NetWorks API'.
      contractor
        ifNotNil: [ 
          canvas
            key: 'workOrders'
            value: [ 
              canvas
                array: [ contractor workOrders do: [ :workOrder | canvas workOrder: workOrder ] ] ] ] ]
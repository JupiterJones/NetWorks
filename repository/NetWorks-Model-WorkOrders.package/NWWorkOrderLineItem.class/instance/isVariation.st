testing
isVariation
  "Answer true if completedQuantity is greater than quantity, or if the status is complete and completedQuantity < quantity"

  ^ quantityComplete > quantity
    or: [ 
      workOrder workFlow == NWWorkflow statusComplete
        and: [ quantityComplete < quantity ] ]
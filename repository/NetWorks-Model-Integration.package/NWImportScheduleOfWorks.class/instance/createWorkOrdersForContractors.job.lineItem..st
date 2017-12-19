private
createWorkOrdersForContractors: contractors job: job lineItem: lineItem
  "Create or update the WorkOrders for each of the contractNames, job and lineItem"

  | workOrder |
  contractors
    do: [ :contractor | 
      "Create or update the lineItem for the WorkOrder for contractor in job"
      workOrder := job workOrders
        detect: [ :workOrder | workOrder contractor == contractor ]
        ifNone: [ 
          job workOrders
            add:
              (NWWorkOrder new
                contractor: contractor;
                job: job;
                title: 'WO-' , job title;
                yourself) ].
      workOrder lineItems
        add:
          (NWWorkOrderLineItem new
            workOrder: workOrder;
            jobLineItem: lineItem;
            quantity: lineItem quantity;
            yourself) ]
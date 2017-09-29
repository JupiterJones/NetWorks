model
createOrFindWorkOrderWithJob: job contractor: contractor
  | workOrder |
  workOrder := job workOrders
    detect: [ :workOrder | contractor == workOrder contractor ]
    ifNone: [ 
      | wo |
      "Create new WorkOrder for contractor that includes a CMWorkOrderLineItem for lineItem"
      job workOrders
        add:
          ((wo := NWWorkOrder new)
            job: job;
            title: job title;
            comment: job comment;
            contractor: contractor;
            hasChanged:
                (Dictionary new
                    at: wo contractorDescription
                      put:
                        {nil.
                          contractor};
                    yourself);
            yourself) ].
  ^ workOrder
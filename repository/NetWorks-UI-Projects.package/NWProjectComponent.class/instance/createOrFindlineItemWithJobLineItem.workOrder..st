model
createOrFindlineItemWithJobLineItem: jobLineItem workOrder: workOrder
  | lineItem |
  lineItem := workOrder lineItems
    detect: [ :lineItem | jobLineItem == lineItem jobLineItem ]
    ifNone: [ 
      | li |
      "Create new WorkOrder for contractor that includes a CMWorkOrderLineItem for lineItem"
      workOrder lineItems
        add:
          ((li := NWWorkOrderLineItem new)
            workOrder: workOrder;
            jobLineItem: jobLineItem;
            comment: jobLineItem job comment;
            quantity: jobLineItem quantity;
            hasChanged:
                (Dictionary new
                    at: li jobLineItemDescription
                      put:
                        {nil.
                          jobLineItem};
                    yourself);
            yourself) ].
  ^ lineItem
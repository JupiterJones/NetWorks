model
createOrFindWorkOrderWithLineItem: jobLineItem contractor: contractor
  | workOrder |
  workOrder := self
    createOrFindWorkOrderWithJob: jobLineItem job
    contractor: contractor.
  ^ self createOrFindlineItemWithJobLineItem: jobLineItem workOrder: workOrder
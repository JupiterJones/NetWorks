testing
isInProgress
  ^ self == NWWorkflow startedStatus
    and: [ self before: NWWorkflow completedStatus ]
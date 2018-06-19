actions
completeAllLineItmes
  "Set all line items to complete and the workflow to complete"

  self model lineItems
    do: [ :lineItem | lineItem quantityComplete: lineItem quantity ].
  self model workflow: NWWorkflow completedStatus.
  self reset
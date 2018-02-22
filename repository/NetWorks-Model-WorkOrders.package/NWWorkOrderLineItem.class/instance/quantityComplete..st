accessing
quantityComplete: anObject
  "If the quantity is not nil and greater than 0, and the workflow hasn't started, then advance the workflow to started"

  (anObject notNil
    and: [ workOrder workflow isInProgress not and: [ anObject asNumber > 0 ] ])
    ifTrue: [ workOrder workflow: NWWorkflow startedStatus ].
  quantityComplete := anObject
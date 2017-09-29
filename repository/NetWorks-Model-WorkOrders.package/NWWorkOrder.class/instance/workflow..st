accessing
workflow: anObject
  workflow := anObject.
  completionDate := workflow == NWWorkflow completedStatus
    ifTrue: [ Date today ]
    ifFalse: [ nil ]
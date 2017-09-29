comparing
after: aWorkflow
  "Answer true if this workflow comes after the aWorkflow"

  (aWorkflow == self or: [ next isNil ])
    ifTrue: [ ^ false ].
  ^ next == aWorkflow or: [ next after: aWorkflow ]
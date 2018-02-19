accessing
projects
  | projects |
  "Return the projects with work orders for this contractor"
  projects := Set new.
  user organisation model projects
    do: [ :project | 
      project jobs
        do: [ :job | 
          (job workOrders
            detect: [ :workOrder | workOrder contractor == self ]
            ifNone: [ nil ]) ifNotNil: [ projects add: project ] ] ].
  ^ projects
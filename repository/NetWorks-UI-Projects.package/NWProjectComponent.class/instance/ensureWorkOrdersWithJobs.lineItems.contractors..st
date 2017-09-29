model
ensureWorkOrdersWithJobs: jobs lineItems: lineItems contractors: contractors
  | myLineItems |
  myLineItems := lineItems
    ifNotNil: [ OrderedCollection withAll: lineItems ]
    ifNil: [ OrderedCollection new ].
  (contractors notNil and: [ contractors notEmpty ])
    ifTrue: [ 
      jobs notNil
        ifTrue: [ 
          "Create WorkOrders for contractor with all line items from jobs"
          jobs
            do: [ :job | 
              contractors
                do: [ :contractor | 
                  self createOrFindWorkOrderWithJob: job contractor: contractor.
                  myLineItems addAll: job lineItems ] ] ].
      myLineItems
        do: [ :lineItem | 
          contractors
            do: [ :contractor | self createOrFindWorkOrderWithLineItem: lineItem contractor: contractor ] ]	"Create workOrder for contractor adding only the provided line items" ]
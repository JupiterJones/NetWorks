private
createJobs
  | jobType lineItemType |
  "Answer the an array of configured Jobs"
  jobs := OrderedCollection new.
  (rows copyFrom: 9 to: rows size)
    do: [ :row | 
      | job jobTypeTitle lineItem |
      (row includesKey: #'sorCode')
        ifTrue: [ 
          "New Line Item Type - Create (or lookup) each job (based on asset) and add a line item for this line item type"
          jobType := self jobTypeFromLineItemTitle: (row at: #'sorCode').
          jobType
            ifNil: [ self errors add: 'No line item type found for ' , (row at: #'sorCode') ]
            ifNotNil: [ lineItemType := self lineItemTypeWithTitle: (row at: #'sorCode') ] ]
        ifFalse: [ 
          (row includesKey: #'asset')
            ifTrue: [ 
              jobType
                ifNil: [ self errors add: 'Can not add line item for asset ' , (row at: #'asset') ]
                ifNotNil: [ 
                  "Look up or create job"
                  job := self
                    jobForAsset: (row at: #'asset')
                    node: (row at: #'node')
                    type: jobType.	"Add line item"
                  job lineItems
                    add:
                      (lineItem := self
                        lineItemWithType: lineItemType
                        title: (row at: #'asset')
                        job: job
                        quantity: (row at: #'designQty')) ].
              (row includesKey: #'contractor')
                ifTrue: [ 
                  self
                    createWorkOrdersForContractors:
                      (self contractorsNamed: (row at: #'contractor'))
                    job: job
                    lineItem: lineItem ] ] ] ]
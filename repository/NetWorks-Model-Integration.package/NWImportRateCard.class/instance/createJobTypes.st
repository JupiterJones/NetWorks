private
createJobTypes
  | jobType lineItemType rate |
  "Answer the an array of configured JobTypes"
  "Row 4 onwards contains JobType info"
  jobTypes := Array new.
  (rows copyFrom: 4 to: rows size)
    do: [ :row | 
      | title comment |
      "Col 1 contains jobType title"
      jobType := (self jobTypeFromRow: row) ifNil: [ jobType ].	"TODO: The lineItemType lookup needs to take into account the client as there may be more than one lineItemType with the same title"
      customerNames
        do: [ :customerName | 
          (row includesKey: ('base_' , customerName) asSymbol)
            ifTrue: [ 
              lineItemType := self
                lineItemTypeForJobType: jobType
                row: row
                customerName: customerName.
              self
                rateForLineItemType: lineItemType
                applyingToCustomerName: customerName
                value: (row at: ('base_' , customerName) asSymbol) ] ].
      contractorNames
        do: [ :contractorName | 
          (contractorName at: #'customers')
            do: [ :customer | 
              (row includesKey: ((contractorName at: #'name') , '_' , customer) asSymbol)
                ifTrue: [ 
                  self
                    rateForJobType: jobType
                    lineItemType: lineItemType
                    applyingToContractorName: (contractorName at: #'name')
                    customer: customer
                    value:
                      (row at: ((contractorName at: #'name') , '_' , customer) asSymbol) ] ] ] ]
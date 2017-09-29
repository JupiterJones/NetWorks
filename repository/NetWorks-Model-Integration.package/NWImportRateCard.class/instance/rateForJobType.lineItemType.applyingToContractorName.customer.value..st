private
rateForJobType: jobType lineItemType: lineItemType applyingToContractorName: name customer: customerName value: value
  | contractor client |
  contractor := self contractorWithName: name.
  client := self customerWithName: customerName.
  (contractor jobTypes includes: jobType)
    ifFalse: [ contractor jobTypes add: jobType ].
  (contractor clients includes: client)
    ifFalse: [ contractor clients add: client ].
  (self valueFrom: value)
    ifNotNil: [ :rate | 
      (lineItemType rates
        detect: [ :r | r appliesTo = contractor and: [ r client = client ] ]
        ifNone: [ 
          lineItemType rates
            add:
              (NWJobLineItemRate new
                lineItemType: lineItemType;
                appliesTo: contractor;
                client: client;
                yourself) ])
        rate: rate ]
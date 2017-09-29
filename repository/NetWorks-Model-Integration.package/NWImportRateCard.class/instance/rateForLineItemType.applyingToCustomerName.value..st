private
rateForLineItemType: lineItemType applyingToCustomerName: name value: value
  | client |
  client := self customerWithName: name.
  (lineItemType clients includes: client)
    ifFalse: [ lineItemType clients add: client ].
  (self valueFrom: value)
    ifNotNil: [ :rate | 
      (lineItemType rates
        detect: [ :r | r appliesTo = client ]
        ifNone: [ 
          lineItemType rates
            add:
              (NWJobLineItemRate new
                lineItemType: lineItemType;
                appliesTo: client;
                yourself) ])
        rate: rate ]
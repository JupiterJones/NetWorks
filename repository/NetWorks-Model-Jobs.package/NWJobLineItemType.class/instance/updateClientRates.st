accessing
updateClientRates
  | newRates |
  newRates := rates
    select: [ :rate | (rate appliesTo isKindOf: NWContractor) or: [ clients includes: rate appliesTo ] ].
  clients
    do: [ :client | 
      rates
        detect: [ :rate | rate appliesTo == client ]
        ifNone: [ 
          newRates
            add:
              (NWJobLineItemRate new
                appliesTo: client;
                lineItemType: self;
                yourself) ] ].
  rates := newRates
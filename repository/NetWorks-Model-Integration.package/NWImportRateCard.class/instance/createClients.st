private
createClients
  "Create the clients in the RateCard doc"

  clients := OrderedCollection new.
  customerNames
    do: [ :clientName | 
      clients
        add:
          (self model clients
            detect: [ :client | client title = clientName ]
            ifNone: [ 
              self model clients
                add:
                  (NWClient new
                    title: clientName;
                    organisation: self model organisation;
                    yourself) ]) ]
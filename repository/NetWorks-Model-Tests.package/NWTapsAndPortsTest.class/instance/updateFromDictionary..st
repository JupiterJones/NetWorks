updating
updateFromDictionary: dataDict
  | updatedTaps updatedPorts |
  updatedTaps := OrderedCollection new.
  (dataDict at: 'taps')
    do: [ :tapDict | 
      | tap |
      tap := updatedTaps
        add:
          ((self tapWithId: (UUID fromString: (tapDict at: 'id')))
            ifNil: [ 
              "create new tap"
              NWTapResult new
                id: (UUID fromString: (tapDict at: 'id'));
                yourself ]).
      tap tap: (tapDict at: 'tap').
      updatedPorts := OrderedCollection new.
      (tapDict at: 'ports')
        do: [ :portDict | 
          | port |
          port := updatedPorts
            add:
              ((tap portWithId: (UUID fromString: (portDict at: 'id')))
                ifNil: [ 
                  "create new port"
                  NWPortResult new
                    id: (UUID fromString: (portDict at: 'id'));
                    yourself ]).
          port
            port: (portDict at: 'port');
            unit: (portDict at: 'unit');
            low: (portDict at: 'low');
            high: (portDict at: 'high') ].
      tap ports: updatedPorts ].
  self taps: updatedTaps
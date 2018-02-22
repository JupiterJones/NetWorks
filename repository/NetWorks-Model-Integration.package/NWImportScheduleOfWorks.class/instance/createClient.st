private
createClient
  | clientTitle |
  clientTitle := (rows at: 5) at: #'sorCode'.
  client := self model clients
    detect: [ :c | c title = clientTitle ]
    ifNone: [ 
      self
        configureClient:
          (self model clients
            add:
              (NWClient new
                title: clientTitle;
                organisation: self model organisation;
                yourself)) ]
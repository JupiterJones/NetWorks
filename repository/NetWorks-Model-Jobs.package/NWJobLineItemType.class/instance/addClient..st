utility
addClient: client
  (clients includes: client)
    ifFalse: [ clients add: client ]
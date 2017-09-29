private
configureClient: c
  "Add line item types to client"

  self model jobTypes
    do: [ :jt | jt lineItemTypes do: [ :lineItemType | lineItemType clients add: c ] ].
  ^ c
accessing
displayItems
  ^ displayItems ifNil: [ displayItems := items copy ]
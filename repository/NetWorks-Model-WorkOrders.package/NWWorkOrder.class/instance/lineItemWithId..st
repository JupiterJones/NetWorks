convenience
lineItemWithId: uuid
  ^ lineItems detect: [ :lineItem | lineItem id = uuid ] ifNone: [ nil ]
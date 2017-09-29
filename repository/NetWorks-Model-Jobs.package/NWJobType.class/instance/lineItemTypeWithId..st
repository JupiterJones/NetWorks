convenience
lineItemTypeWithId: uuid
  ^ lineItemTypes detect: [ :lineItemType | lineItemType id = uuid ]
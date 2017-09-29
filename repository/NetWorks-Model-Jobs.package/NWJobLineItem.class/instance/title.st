accessing
title
  ^ lineItemType ifNil: [ 'New Line Item' ] ifNotNil: [ lineItemType title ]
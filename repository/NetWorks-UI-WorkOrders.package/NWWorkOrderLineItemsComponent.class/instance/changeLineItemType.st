actions
changeLineItemType
  self
    call:
      (NWChangeWorkOrderLineItem new
        lineItem: self model;
        yourself)
    onAnswer: [ :newLineItem | 
      newLineItem
        ifNotNil: [ 
          self memento setModel: newLineItem.
          self memento reset ] ]
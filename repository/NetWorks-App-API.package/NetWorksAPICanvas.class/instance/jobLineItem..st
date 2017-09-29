model object
jobLineItem: lineItem
  self
    object: [ 
      self
        key: 'note' value: lineItem note;
        key: 'lineItemType' value: [ self lineItemType: lineItem lineItemType ] ]
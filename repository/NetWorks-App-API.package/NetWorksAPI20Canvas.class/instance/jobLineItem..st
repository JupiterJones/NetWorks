model object
jobLineItem: lineItem
  self
    object: [ 
      self
        key: 'id' value: lineItem id asString;
        key: 'note' value: lineItem note;
        key: 'lineItemType'
          value: [ self jobLineItemType: lineItem lineItemType ] ]
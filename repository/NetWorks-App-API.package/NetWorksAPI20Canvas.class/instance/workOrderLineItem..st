model object
workOrderLineItem: lineItem
  self
    object: [ 
      self
        key: 'id' value: lineItem id asString;
        key: 'jobLineItem' value: [ self jobLineItem: lineItem jobLineItem ];
        key: 'quantity' value: lineItem quantity;
        key: 'complete' value: lineItem quantityComplete;
        key: 'files' value: lineItem fileDirectory fileNames;
        key: 'tests' value: lineItem tests ]
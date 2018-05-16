model object
jobType: jobType jobLineItemTypes: jobLineItemTypes
  self
    object: [ 
      self
        key: 'id' value: jobType id asString;
        key: 'title' value: jobType title;
        key: 'comment' value: jobType comment;
        key: 'lineItemTypes'
          value: [ 
              self
                array: [ 
                  jobLineItemTypes
                    do: [ :jobLineItemType | self jobLineItemType: jobLineItemType ] ] ] ]
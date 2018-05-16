private
lineItemTypeForJobType: jobType row: row customerName: customerName
  | client title comment |
  client := self customerWithName: customerName.
  ^ (title := row at: #'lineItemTypeTitle' ifAbsent: [ nil ])
    ifNotNil: [ 
      (comment := row at: #'lineItemTypeComment' ifAbsent: [ nil ])
        ifNotNil: [ 
          jobType lineItemTypes
            detect: [ :lineItemType | lineItemType title = title and: [ lineItemType comment = comment ] ]
            ifNone: [ 
              jobType lineItemTypes
                add:
                  (NWJobLineItemType new
                    title: title;
                    comment: comment;
                    addClient: client;
                    yourself) ] ] ]
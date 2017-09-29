private
lineItemTypeForJobType: jobType row: row
  | title comment |
  ^ (title := row at: #'lineItemTypeTitle' ifAbsent: [ nil ])
    ifNotNil: [ 
      (comment := row at: #'lineItemTypeComment' ifAbsent: [ nil ])
        ifNotNil: [ 
          jobType lineItemTypes
            detect: [ :lineItemType | lineItemType title = title ]
            ifNone: [ 
              jobType lineItemTypes
                add:
                  (NWJobLineItemType new
                    title: title;
                    comment: comment;
                    yourself) ] ] ]
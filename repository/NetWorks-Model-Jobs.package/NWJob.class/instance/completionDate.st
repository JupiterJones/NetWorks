accessing
completionDate
  | distantPast |
  "Answer the date of the last finished workOrder"
  distantPast := Date fromSeconds: 0.
  ^ (workOrders
    asSortedCollection: [ :w1 :w2 | 
      (w1 completionDate ifNil: [ distantPast ])
        > (w2 compeltionDate ifNil: [ distantPast ]) ])
    ifEmpty: [ nil ]
    ifNotEmpty: [ :workOrders | workOrders last completionDate ]
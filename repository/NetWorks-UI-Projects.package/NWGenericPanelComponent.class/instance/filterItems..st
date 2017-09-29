actions
filterItems: itemsCollection
  | result |
  result := Set new.
  filters
    do: [ :f | 
      f isActive
        ifTrue: [ result addAll: (f filterItems: itemsCollection) ] ].
  (self hasSearch and: [ searchText notEmpty ])
    ifTrue: [ result := result select: [ :item | item title includesString: searchText ] ].
  ^ OrderedCollection withAll: result
json
jsonForNode: aNode depth: depth
  | data children object |
  data := Dictionary new.
  data at: '$color' put: (self colorOfNode: aNode).
  children := depth > 0
    ifTrue: [ 
      ((aNode perform: self magritteDescription hierarchyDownSelector)
        asSortedCollection: [ :a1 :a2 | 
          (self magritteDescription nodeLabelBlock value: a1)
            <= (self magritteDescription nodeLabelBlock value: a2) ])
        collect: [ :asset | self jsonForNode: asset depth: depth - 1 ] ]
    ifFalse: [ #() ].
  object := Dictionary new.
  object at: 'name' put: (self magritteDescription nodeLabelBlock value: aNode).
  object at: 'id' put: (self idForPassenger: aNode).
  object at: 'data' put: data.
  object at: 'children' put: children.
  ^ object
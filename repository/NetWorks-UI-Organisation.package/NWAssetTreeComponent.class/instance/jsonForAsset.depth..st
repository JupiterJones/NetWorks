JSON
jsonForAsset: anAsset depth: depth
  | data children object |
  data := Dictionary new.
  data at: '$color' put: (self colorOfAsset: anAsset).
  children := depth > 0
    ifTrue: [ 
      (anAsset subclasses asSortedCollection: [ :a1 :a2 | a1 name <= a2 name ])
        collect: [ :asset | self jsonForAsset: asset depth: depth - 1 ] ]
    ifFalse: [ #() ].
  object := Dictionary new.
  object at: 'name' put: anAsset name.
  object at: 'id' put: (self idForPassenger: anAsset).
  object at: 'data' put: data.
  object at: 'children' put: children.
  ^ object
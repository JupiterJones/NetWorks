private
assetForAsset: asset node: node
  "Using the assetPrefix as the top level asset and the node as the breakpoint.
ie.
asset: 2YON-01-01-FNO-001
prefix: 2YON-01
node: 1

shoud yield:
top level: 2YON-01
second level: 01-FNO-001.

the other option are assets numbered like: 000000002603515189
they have a node number 0,1,2,etc. however they may also be UNKNOWN
"

  | topLevelAsset assetLevel2 result |
  topLevelAsset := self assetWithTitle: assetPrefix.
  assetLevel2 := (asset startsWith: assetPrefix)
    ifTrue: [ asset copyFrom: assetPrefix size + 2 to: asset size ]
    ifFalse: [ asset ].
  result := topLevelAsset assets
    detect: [ :a | a title = assetLevel2 ]
    ifNone: [ 
      topLevelAsset assets
        add:
          (NWAsset new
            title: assetLevel2;
            parent: topLevelAsset;
            comment: 'Node: ' , node;
            yourself) ].
  ^ result
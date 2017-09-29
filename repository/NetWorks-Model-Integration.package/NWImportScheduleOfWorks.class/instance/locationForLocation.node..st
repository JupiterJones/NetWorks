private
locationForLocation: location node: node
  "Using the locationPrefix as the top level asset and the node as the breakpoint.
ie.
location: 2YON-01-01-FNO-001
prefix: 2YON-01
node: 1

shoud yield:
top level: 2YON-01
second level: 01-FNO-001.

the other option are locations numbered like: 000000002603515189
they have a node number 0,1,2,etc. however they may also be UNKNOWN
"

  | topLevelLocation locationLevel2 result |
  topLevelLocation := self assetWithTitle: assetPrefix.
  locationLevel2 := (location startsWith: assetPrefix)
    ifTrue: [ location copyFrom: assetPrefix size + 2 to: location size ]
    ifFalse: [ location ].
  result := topLevelLocation locations
    detect: [ :a | a title = locationLevel2 ]
    ifNone: [ 
      topLevelLocation assets
        add:
          (NWLocation new
            title: locationLevel2;
            parent: topLevelLocation;
            comment: 'Node: ' , node;
            yourself) ].
  ^ result
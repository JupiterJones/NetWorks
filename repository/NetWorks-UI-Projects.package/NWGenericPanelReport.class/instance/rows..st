accessing
rows: aCollection
  super rows: aCollection	"aCollection
    ifNotEmpty: [ selectedItems := OrderedCollection with: aCollection first ]"
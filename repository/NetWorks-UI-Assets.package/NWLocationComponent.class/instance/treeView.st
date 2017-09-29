accessing
treeView
  ^ treeView ifNil: [ treeView := NWAssetTreeComponent new ]
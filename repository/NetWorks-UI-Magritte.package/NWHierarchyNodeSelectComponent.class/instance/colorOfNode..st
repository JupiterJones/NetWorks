options
colorOfNode: aNode
  | size |
  size := (aNode perform: self magritteDescription hierarchyDownSelector) size.
  ^ self colorOfNode: aNode size: size
options
colorOfAsset: anAsset
  | size |
  size := anAsset subclasses size.
  ^ self colorOfAsset: anAsset size: size
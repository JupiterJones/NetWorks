private
validUriFrom: aStringOrSymbol
  | newUri |
  newUri := self sanitise: aStringOrSymbol.
  newUri size > 0
    ifTrue: [ newUri := self uriPrefix , newUri ].
  ^ newUri
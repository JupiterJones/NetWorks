accessing-attributes
attributes
  "Lazily initialise a MAAdaptiveModel to hold attributes for this object"

  ^ attributes ifNil: [ attributes := MAAdaptiveModel new ]
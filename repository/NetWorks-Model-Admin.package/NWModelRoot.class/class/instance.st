accessing
instance
  "NWModelRoot instance"

  ^ instance ifNil: [ instance := self new ]
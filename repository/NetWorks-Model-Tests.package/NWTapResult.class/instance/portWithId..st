convenience
portWithId: uuid
  ^ ports detect: [ :port | port id = uuid ] ifNone: [ nil ]
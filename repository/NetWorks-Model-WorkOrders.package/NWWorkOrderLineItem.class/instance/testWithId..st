convenience
testWithId: uuid
  ^ tests detect: [ :test | test id = uuid ] ifNone: [ nil ]
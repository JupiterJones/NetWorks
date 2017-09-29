convenience
tapWithId: uuid
  ^ taps detect: [ :tap | tap id = uuid ] ifNone: [ nil ]
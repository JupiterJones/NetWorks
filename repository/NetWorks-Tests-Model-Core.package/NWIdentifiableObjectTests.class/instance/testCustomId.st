tests
testCustomId
  | object id |
  id := UUID new.
  object := NWIdentifiableObject new
    id: id;
    yourself.
  self assert: object id == id
tests
testSetClient
  | client |
  self assert: model client isNil.
  client := NWClient new.
  model client: client.
  self assert: model client == client
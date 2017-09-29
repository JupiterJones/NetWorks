tests
testAddOrganisation
  | organisation |
  organisation := NWOrganisation new.
  self assert: model organisations size == 0.
  model organisations add: organisation.
  self assert: model organisations size == 1.
  self assert: model organisations anyOne == organisation
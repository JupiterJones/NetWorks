tests
testOganisationModel
  | object |
  object := NWOrganisation new.
  self assert: (object model isKindOf: NWOrganisationModel)
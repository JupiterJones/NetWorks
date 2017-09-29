magritte-hooks
backReference: aModel
  (aModel isKindOf: NWOrganisationModel)
    ifTrue: [ organisation := aModel organisation ]
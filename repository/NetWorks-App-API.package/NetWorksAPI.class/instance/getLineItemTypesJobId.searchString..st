api information
getLineItemTypesJobId: jobId searchString: searchString
  "Answer the set of work orders for this contractor"

  <get>
  <path: '/lineItemTypes?jobId={jobId}&searchString={searchString}'>
  <produces: 'application/json'>
  | lineItemTypes |
  lineItemTypes := (NWCurrentOrganisation value model
    jobWithId: (UUID fromString: jobId)) jobType lineItemTypes.
  searchString notEmpty
    ifTrue: [ 
      lineItemTypes := lineItemTypes
        select: [ :lineItemType | lineItemType title includesString: searchString ] ].
  ^ NetWorksAPICanvas builder
    render: [ :canvas | self renderLineItemTypes: lineItemTypes on: canvas ]
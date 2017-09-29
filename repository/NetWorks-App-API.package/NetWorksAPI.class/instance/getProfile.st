api information
getProfile
  "Answer the api-key for this authorisation"

  <get>
  <path: '/profile'>
  <produces: 'application/json'>
  ^ NetWorksAPICanvas builder
    render: [ :canvas | self renderContractorProfile: NWCurrentContractor value on: canvas ]
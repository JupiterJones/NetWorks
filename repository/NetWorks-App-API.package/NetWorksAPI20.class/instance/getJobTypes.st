api calls
getJobTypes
  "Answer the colleciton of jobTypes and jobLineItemTypes for the contractor"

  <get>
  <path: '/jobTypes'>
  <produces: 'application/json'>
  ^ NetWorksAPI20Canvas builder
    render: [ :canvas | 
      self
        renderJobTypes: NWCurrentOrganisation value model jobTypes
        contractor: NWCurrentContractor value
        on: canvas ]
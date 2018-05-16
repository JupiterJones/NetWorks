api calls
getProjects
  "Answer the model"

  <get>
  <path: '/projects'>
  <produces: 'application/json'>
  ^ NetWorksAPI20Canvas builder
    render: [ :canvas | self renderProjectsOn: canvas contractor: NWCurrentContractor value ]
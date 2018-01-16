as yet unclassified
getProjects
  "Answer the model"

  <get>
  <path: '/projects'>
  <produces: 'application/json'>
  ^ NetWorksAPICanvas builder
    render: [ :canvas | self renderProjectsOn: canvas ]
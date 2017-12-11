as yet unclassified
getProjects
  "Answer the model"

  <get>
  <path: '/Projects'>
  <produces: 'application/json'>
  ^ NetWorksAPICanvas builder
    render: [ :canvas | self renderProjectsOn: canvas ]
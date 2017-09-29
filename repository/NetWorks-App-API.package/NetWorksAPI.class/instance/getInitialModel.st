api information
getInitialModel
  "Answer the model"

  <get>
  <path: '/model'>
  <produces: 'application/json'>
  ^ NetWorksAPICanvas builder render: [ :canvas | self renderModelOn: canvas ]
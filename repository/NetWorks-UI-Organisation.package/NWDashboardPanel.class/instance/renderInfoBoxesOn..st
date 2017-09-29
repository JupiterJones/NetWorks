rendering
renderInfoBoxesOn: canvas
  canvas tbsRow
    with: [ 
      self
        renderClientsInfoBoxOn: canvas;
        renderProjectsInfoBoxOn: canvas;
        renderJobsInfoBoxOn: canvas;
        renderWorkOrdersInfoBoxOn: canvas ]
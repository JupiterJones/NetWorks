rendering
renderInfoBoxesOn: canvas
  canvas tbsRow
    with: [ 
      self
        renderProjectsInfoBoxOn: canvas;
        renderWorkOrdersInfoBoxOn: canvas ]
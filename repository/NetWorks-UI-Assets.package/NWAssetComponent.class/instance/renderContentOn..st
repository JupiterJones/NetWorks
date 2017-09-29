rendering
renderContentOn: canvas
  self renderLocationPathOn: canvas.
  canvas render: self treeView.
  super renderContentOn: canvas
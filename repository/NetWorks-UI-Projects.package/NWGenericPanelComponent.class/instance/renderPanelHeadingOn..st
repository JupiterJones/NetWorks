rendering
renderPanelHeadingOn: canvas
  canvas adminLTEBoxTitle: self title.
  canvas adminLTEBoxTools: [ self renderFiltersOn: canvas ]
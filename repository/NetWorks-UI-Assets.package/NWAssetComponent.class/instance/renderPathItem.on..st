rendering
renderPathItem: location on: canvas
  location parent ifNotNil: [ self renderPathItem: location parent on: canvas ].
  canvas tbsBreadcrumbSection with: location title
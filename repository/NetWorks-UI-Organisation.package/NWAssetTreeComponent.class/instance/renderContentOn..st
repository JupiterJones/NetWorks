rendering
renderContentOn: html
  | visualization |
  visualization := self createVisualizationFor: html.
  html paragraph: [ self renderVisualization: visualization on: html ]
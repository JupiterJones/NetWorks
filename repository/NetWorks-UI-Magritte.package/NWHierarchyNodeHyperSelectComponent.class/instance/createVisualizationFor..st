rendering
createVisualizationFor: html
  | graph |
  graph := html infoVis hyperTree.
  graph
    duration: 500;
    transition: InfoVisTransition quartetic easeInOut.
  graph navigationOptions zooming: 30.
  graph nodeOptions
    dimension: 9;
    overridable: true.
  graph edgeOptions
    color: self edgeColor;
    overridable: true.
  graph
    onCreateLabel:
      ((self labelFunctionFor: graph on: html) asFunction: #(#'label' #'node')).
  graph
    onPlaceLabel:
      ((self placeLabelFunctionFor: graph) asFunction: #(#'label' #'node')).
  self setDefaultOptions: graph.
  ^ graph
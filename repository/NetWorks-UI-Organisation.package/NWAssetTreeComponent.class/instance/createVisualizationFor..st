rendering
createVisualizationFor: html
  | spaceTree |
  spaceTree := html infoVis spaceTree.
  spaceTree levelDistance: 50.
  spaceTree
    duration: 300;
    transition: InfoVisTransition quartetic easeInOut;
    width: false;
    height: false.
  spaceTree navigationOptions panning: false.
  spaceTree nodeOptions
    width: 150;
    height: 20;
    rectangle;
    overridable: true.
  spaceTree edgeOptions
    displayAsBezier;
    overridable: true.
  spaceTree
    onCreateLabel:
      ((self labelFunctionFor: spaceTree) asFunction: #(#'label' #'node')).
  self setDefaultOptions: spaceTree.
  ^ spaceTree
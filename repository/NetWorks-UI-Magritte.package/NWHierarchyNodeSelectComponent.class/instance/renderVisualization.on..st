rendering
renderVisualization: tree on: html
  html div
    class: self visualizationCssClass;
    script: tree.	" load data "
  html document
    addLoadScript:
      (html jQuery getJson
        infoVisJson: [ self jsonData ];
        onSuccess:
            tree loadJson , tree compute
                ,
                  (tree onClick: (self idForPassenger: (self value ifNil: [ self rootNode ]))))
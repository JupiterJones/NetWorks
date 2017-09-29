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
            tree loadJson , (tree compute: 'end')
                , (tree animateFor: 1000 modes: #('polar')))
rendering
renderViewerOn: html
  | visualization |
  visualization := self createVisualizationFor: html.
  html div
    class: 'hierarchyNodeSelect';
    with: [ 
          html
            tbsFormGroup: [ 
              html textInput
                id: (textInputId := html nextId);
                value: self value title ].
          self renderVisualization: visualization on: html ]
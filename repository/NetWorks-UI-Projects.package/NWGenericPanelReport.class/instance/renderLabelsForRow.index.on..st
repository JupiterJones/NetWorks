rendering
renderLabelsForRow: row index: index on: html
  html div
    class: 'labels';
    with: [ 
          html div
            class: 'title';
            with: [ self visibleColumns first renderCell: row index: index on: html ].
          self visibleColumns size > 1
            ifTrue: [ 
              html div
                class: 'comment';
                with: [ self visibleColumns second renderCell: row index: index on: html ] ] ]
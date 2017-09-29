rendering
renderColumnsForRow: row index: index on: html
  self visibleColumns size > 2
    ifTrue: [ 
      html div
        class: 'columns';
        with: [ 
              (self visibleColumns copyFrom: 3 to: self visibleColumns size)
                do: [ :col | 
                  html div
                    class: 'col';
                    with: [ 
                          col renderCell: row index: index on: html.
                          (self
                            iconSelectorForDescription: col magritteDescription)
                            ifNotNil: [ :iconSelector | 
                              html space.
                              html span
                                fontAwesome;
                                perform: iconSelector ] ] ] ] ]
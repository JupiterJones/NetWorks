rendering
renderEditorOn: canvas
  canvas
    tbsRow: [ 
      "REQUEST: Move search to left - donde below"
      canvas tbsColumn
        smallSize: 6;
        with: [ self renderSearchOn: canvas ].
      canvas tbsColumn
        smallSize: 6;
        with: [ 
              self magritteDescription isDefinitive
                ifFalse: [ self renderSelectListOn: canvas ] ] ].
  self renderViewerOn: canvas
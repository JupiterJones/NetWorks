rendering
renderEditorOn: canvas
  canvas
    tbsRow: [ 
      canvas tbsColumn
        smallSize: 6;
        with: [ 
              self magritteDescription isDefinitive
                ifFalse: [ self renderSelectListOn: canvas ] ].
      canvas tbsColumn
        smallSize: 6;
        with: [ self renderSearchOn: canvas ] ].
  self renderViewerOn: canvas
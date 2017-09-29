rendering
renderFilesOn: canvas
  canvas
    tbsRow: [ 
      canvas tbsColumn
        smallSize: 12;
        with: [ canvas render: self finderComponent ] ]
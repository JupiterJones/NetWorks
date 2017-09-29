rendering
renderAdminContentOn: canvas
  canvas tbsRow
    with: [ 
      canvas tbsColumn
        smallSize: 12;
        largeSize: 12;
        with: [ canvas render: self organisationsComponent ] ]
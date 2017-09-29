rendering
renderContentOn: canvas
  canvas
    tbsRow: [ 
      canvas tbsColumn
        smallSize: 6;
        with: [ self renderDescriptionsWithLabels: #('Title' 'Comment') on: canvas ].
      canvas tbsColumn
        smallSize: 6;
        with: [ 
              self
                renderDescriptionsWithLabels:
                  #('Job Line Item' 'Type' 'Description')
                on: canvas ] ].
  canvas
    tbsRow: [ 
      canvas tbsColumn
        smallSize: 12;
        with: [ self renderDescriptionsWithLabels: #('Quantity' 'Quantity Complete') on: canvas ] ].
  canvas
    tbsRow: [ 
      canvas tbsColumn
        smallSize: 12;
        with: [ self renderDescriptionsWithLabels: #('Tests') on: canvas ] ]
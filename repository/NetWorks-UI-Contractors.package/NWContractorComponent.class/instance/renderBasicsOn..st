rendering
renderBasicsOn: canvas
  canvas
    tbsRow: [ 
      canvas tbsColumn
        smallSize: 6;
        with: [ 
              self
                renderDescriptionsWithLabels:
                  #('Name' 'Comment' 'Email' 'Avatar Image')
                on: canvas ].
      canvas tbsColumn
        smallSize: 6;
        with: [ self renderDescriptionsWithLabels: #('Enabled' 'Job Types' 'Clients') on: canvas ] ]
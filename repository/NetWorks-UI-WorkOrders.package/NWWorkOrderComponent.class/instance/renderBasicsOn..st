rendering
renderBasicsOn: canvas
  canvas
    tbsRow: [ 
      canvas tbsColumn
        smallSize: 6;
        with: [ self renderDescriptionsWithLabels: #('Title' 'Comment' 'Contractor') on: canvas ].
      canvas tbsColumn
        smallSize: 6;
        with: [ 
              self
                renderDescriptionsWithLabels:
                  #('Asset' 'Workflow' 'Date Scheduled' 'Duration' 'DateComplete')
                on: canvas ] ].
  self renderLineItemsOn: canvas
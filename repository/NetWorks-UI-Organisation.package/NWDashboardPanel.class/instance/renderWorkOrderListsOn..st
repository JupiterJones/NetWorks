rendering
renderWorkOrderListsOn: canvas
  canvas
    tbsRow: [ 
      canvas tbsColumn
        smallSize: 6;
        with: [ canvas render: self workOrdersInProgressComponent ].
      canvas tbsColumn
        smallSize: 6;
        with: [ canvas render: self workOrdersCompletedComponent ] ]
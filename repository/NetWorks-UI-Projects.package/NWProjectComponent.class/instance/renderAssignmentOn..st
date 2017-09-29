rendering
renderAssignmentOn: canvas
  self renderDetectDeleteOn: canvas.
  canvas div
    class: 'assignment';
    with: [ 
          canvas tbsRow
            class: 'jobs';
            with: [ 
                  canvas tbsColumn
                    smallSize: 6;
                    class: 'jobsList focus';
                    with: [ canvas render: (focus := workOrderFocus := self jobListComponent) ].
                  canvas tbsColumn
                    smallSize: 6;
                    class: 'jobLineItems';
                    with: [ canvas render: self jobLineItemsComponent ] ].
          canvas
            tbsRow: [ 
              canvas tbsColumn
                smallSize: 12;
                with: [ canvas paragraph: 'Drag Jobs or Line Items to contractors to assign work' ] ].
          canvas tbsRow
            class: 'workOrders';
            with: [ 
                  canvas tbsColumn
                    smallSize: 2;
                    class: 'contractors';
                    with: [ canvas render: self contractorsComponent ].
                  canvas tbsColumn
                    smallSize: 4;
                    class: 'workOrderList';
                    with: [ canvas render: self workOrdersComponent ].
                  canvas tbsColumn
                    smallSize: 6;
                    class: 'workOrderLineItems';
                    with: [ canvas render: self workOrderLineItemsComponent ] ] ]
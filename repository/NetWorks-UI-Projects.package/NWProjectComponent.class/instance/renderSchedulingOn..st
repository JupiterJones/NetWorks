rendering
renderSchedulingOn: canvas
  self renderDetectDeleteOn: canvas.
  canvas div
    class: 'scheduling';
    with: [ 
          canvas tbsRow
            class: 'workOrders';
            with: [ 
                  canvas tbsColumn
                    smallSize: 4;
                    class: 'contractors';
                    with: [ canvas render: self contractorsComponent ].
                  canvas tbsColumn
                    smallSize: 8;
                    class: 'workOrderList';
                    with: [ canvas render: self workOrdersComponent ] ].
          canvas tbsRow
            class: 'calendar';
            with: [ canvas render: self calendarComponent ] ]
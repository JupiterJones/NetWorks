rendering
renderWorkOrdersCompletedOn: canvas
  canvas
    tbsRow: [ 
      canvas tbsColumn
        smallSize: 6;
        with: [ 
              canvas adminLTEBox
                beSolid;
                bePrimary;
                with: [ 
                      canvas adminLTEBoxHeader
                        withBorder;
                        with: [ canvas adminLTEBoxTitle: 'Work Orders Completed' ].
                      canvas
                        adminLTEBoxBody: [ self renderWorkOrdersCompletedChartOn: canvas ].
                      canvas
                        adminLTEBoxFooter: [ canvas paragraph: 'This is the footer' ] ] ] ]
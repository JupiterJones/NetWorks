rendering
renderWorkOrdersCompletedChartOn: canvas
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
                        adminLTEBoxBody: [ canvas paragraph: 'Chart goes here' ].
                      canvas
                        adminLTEBoxFooter: [ canvas paragraph: 'This is the footer' ] ] ] ]
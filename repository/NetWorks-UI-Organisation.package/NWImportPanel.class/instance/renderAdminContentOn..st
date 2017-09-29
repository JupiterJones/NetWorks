rendering
renderAdminContentOn: canvas
  canvas tbsRow
    with: [ 
      canvas tbsColumn
        smallSize: 6;
        with: [ 
              canvas
                adminLTEBox: [ 
                  canvas adminLTEBoxHeader
                    withBorder;
                    with: [ canvas adminLTEBoxTitle: 'Rate Card' ].
                  canvas
                    adminLTEBoxBody: [ self renderImportRateCardOn: canvas ] ] ].
      canvas tbsColumn
        smallSize: 6;
        with: [ 
              canvas
                adminLTEBox: [ 
                  canvas adminLTEBoxHeader
                    withBorder;
                    with: [ canvas adminLTEBoxTitle: 'Schedule of works' ].
                  canvas
                    adminLTEBoxBody: [ self renderImportScheduleOfWorksOn: canvas ] ] ] ]
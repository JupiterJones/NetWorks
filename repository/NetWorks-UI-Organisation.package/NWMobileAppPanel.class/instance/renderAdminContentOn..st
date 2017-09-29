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
                    with: [ canvas adminLTEBoxTitle: 'Mobile Application' ].
                  canvas adminLTEBoxBody: [ self renderDownloadOn: canvas ] ] ].
      canvas tbsColumn
        smallSize: 6;
        with: [ 
              canvas
                adminLTEBox: [ 
                  canvas adminLTEBoxHeader
                    withBorder;
                    with: [ canvas adminLTEBoxTitle: 'Mobile Authorisation' ].
                  canvas adminLTEBoxBody: [ self renderAuthorisationOn: canvas ] ] ] ]
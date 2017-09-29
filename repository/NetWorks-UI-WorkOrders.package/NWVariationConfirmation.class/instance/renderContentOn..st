rendering
renderContentOn: canvas
  canvas
    tbsRow: [ 
      canvas tbsColumn
        mediumSize: 6;
        mediumOffset: 3;
        with: [ 
              canvas adminLTEBox
                beWarning;
                beSolid;
                with: [ 
                      canvas adminLTEBoxHeader
                        withBorder;
                        with: [ canvas adminLTEBoxTitle: 'Variation Warning' ].
                      canvas
                        adminLTEBoxBody: [ 
                          canvas
                            paragraph: [ 
                              canvas
                                text: 'The quantity requested was ';
                                strong: self requestedQuantity;
                                text:
                                    '. However, you are claiming to have completed ';
                                strong: self completedQuantity;
                                text: '.'.
                              canvas paragraph: 'Is this correct?' ] ].
                      canvas
                        adminLTEBoxFooter: [ 
                          canvas form
                            class: 'buttons';
                            with: [ 
                                  canvas tbsButton
                                    beDefault;
                                    callback: [ self answer: false ];
                                    with: 'No'.
                                  canvas tbsButton
                                    beWarning;
                                    callback: [ self answer: true ];
                                    with: 'Yes' ] ] ] ] ]
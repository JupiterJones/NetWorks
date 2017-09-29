rendering
renderContentOn: canvas
  canvas
    tbsRow: [ 
      canvas tbsColumn
        mediumSize: 8;
        mediumOffset: 2;
        with: [ 
              canvas
                form: [ 
                  canvas adminLTEBox
                    beWarning;
                    beSolid;
                    with: [ 
                          canvas adminLTEBoxHeader
                            withBorder;
                            with: [ canvas adminLTEBoxTitle: self lineItem workOrder title ].
                          canvas
                            adminLTEBoxBody: [ self renderSelectNewTypeOn: canvas ].
                          canvas
                            adminLTEBoxFooter: [ 
                              canvas div
                                class: 'buttons';
                                with: [ 
                                      canvas tbsButton
                                        beDefault;
                                        callback: [ self answer: nil ];
                                        with: 'Cancel'.
                                      canvas tbsButton
                                        callback: [ self updateLineItemType ];
                                        with: 'Change Type' ] ] ] ] ] ]
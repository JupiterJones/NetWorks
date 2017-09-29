rendering
renderInfoBoxesOn: canvas
  canvas tbsRow
    with: [ 
      self infoBoxData
        do: [ :infoBoxExample | 
          canvas tbsColumn
            mediumSize: 3;
            smallSize: 6;
            extraSmallSize: 12;
            with: [ 
                  canvas
                    render:
                      (AdminLTEInfoBox2Widget new
                        icon: (infoBoxExample at: #'icon');
                        label: (infoBoxExample at: #'label');
                        number: (infoBoxExample at: #'number');
                        widgetColor: (infoBoxExample at: #'widgetColor');
                        progressValue: (infoBoxExample at: #'progressValue');
                        progressDescription:
                            (infoBoxExample at: #'progressDescription');
                        yourself) ] ] ]
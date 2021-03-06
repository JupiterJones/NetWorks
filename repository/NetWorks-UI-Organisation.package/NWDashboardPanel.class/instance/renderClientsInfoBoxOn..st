rendering
renderClientsInfoBoxOn: canvas
  canvas tbsColumn
    mediumSize: 3;
    smallSize: 6;
    extraSmallSize: 12;
    with: [ 
          canvas anchor
            callback: [ 
                  self rootAnnouncer
                    announce:
                      (AdminLTEPanelSelected panel: (self parent panelOfType: NWClientsPanel)) ];
            with: [ 
                  canvas
                    render:
                      (AdminLTEInfoBoxWidget new
                        icon: #'buildingOutlined';
                        label: 'Clients';
                        number: self model clients size;
                        widgetColor: 'aqua';
                        yourself) ] ]
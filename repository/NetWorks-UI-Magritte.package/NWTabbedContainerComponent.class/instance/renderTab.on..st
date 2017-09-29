rendering
renderTab: tab on: canvas
  canvas tbsNavItem
    beActiveIf: selectedTab == (tab at: #'id');
    with: [ 
          canvas button
            callback: [ 
                  self validate
                    ifTrue: [ 
                      self commit.
                      (tab at: #'callback') value ] ];
            with: [ 
                  (tab at: #'icon')
                    ifNotNil: [ 
                      (canvas tag: 'i')
                        fontAwesome;
                        perform:
                            ('fontAwesome' , (tab at: #'icon') capitalized , 'Icon') asSymbol.
                      canvas space ].
                  canvas render: (tab at: #'label') ] ]
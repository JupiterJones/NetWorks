rendering
renderTabsOn: canvas
  canvas div
    class: 'nav-tabs-custom';
    with: [ 
          canvas tbsNav
            beTabs;
            tbsPullRight;
            with: [ 
                  self tabs do: [ :tab | self renderTab: tab on: canvas ].
                  self renderLabelOn: canvas ].
          canvas div
            class: 'tab-content';
            with: [ self perform: ('render' , selectedTab capitalized , 'On:') asSymbol with: canvas ] ]
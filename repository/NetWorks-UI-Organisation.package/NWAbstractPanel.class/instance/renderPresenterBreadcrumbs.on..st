rendering
renderPresenterBreadcrumbs: crumbs on: canvas
  crumbs
    withIndexDo: [ :crumb :index | 
      canvas listItem
        class: 'active' if: crumb == crumbs last;
        with: [ 
              canvas anchor
                callback: [ 
                      crumb ~~ crumbs last
                        ifTrue: [ ((crumbs at: index + 1) at: #'presenter') answer ] ];
                with: [ 
                      (canvas tag: 'i')
                        fontAwesome;
                        perform:
                            ('fontAwesome' , (crumb at: #'icon') capitalized , 'Icon') asSymbol.
                      canvas
                        space;
                        text: (crumb at: #'title') ] ] ]
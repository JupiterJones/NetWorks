rendering
renderCellLinkContent: anObject on: html
  "Icon command key -> { textString. iconSelectorSymbol }"

  self commands
    do: [ :each | 
      html anchor
        class: 'icon-command';
        callback: [ each key value: anObject ];
        with: [ 
              (html tag: 'i')
                fontAwesome;
                perform: each value last;
                with: [ html span tbsScreenReaderOnly with: each value first ] ] ]
    separatedBy: [ 
      html
        space;
        space ]
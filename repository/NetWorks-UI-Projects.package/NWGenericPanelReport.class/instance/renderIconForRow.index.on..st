rendering
renderIconForRow: row index: index on: html
  html div
    class: 'icon';
    with: [ 
          html span
            fontAwesome;
            perform:
                (self iconSelectorForDescription: self columns first magritteDescription);
            fontAwesome2x ]
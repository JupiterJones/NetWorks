rendering
renderLabelOn: canvas
  canvas tbsNavItem
    tbsPullLeft;
    class: 'header';
    with: [ 
          (canvas tag: 'i')
            fontAwesome;
            perform: ('fontAwesome' , self icon capitalized , 'Icon') asSymbol.
          canvas
            render:
              ((self model readUsing: self model titleDescription)
                ifNil: [ self newObjectLabel ]) ]
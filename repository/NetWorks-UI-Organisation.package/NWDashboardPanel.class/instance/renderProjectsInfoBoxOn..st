rendering
renderProjectsInfoBoxOn: canvas
  canvas tbsColumn
    mediumSize: 3;
    smallSize: 6;
    extraSmallSize: 12;
    with: [ 
          canvas
            render:
              (AdminLTEInfoBoxWidget new
                icon: #'briefcase';
                label: 'Projects';
                number: self model projects size;
                widgetColor: 'aqua';
                yourself) ]
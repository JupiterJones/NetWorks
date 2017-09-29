rendering
renderContentOn: canvas
  canvas adminLTEBox
    beDefault;
    beSolid;
    with: [ 
          canvas adminLTEBoxHeader
            withBorder;
            with: [ self renderPanelHeadingOn: canvas ].
          canvas adminLTEBoxBody with: [ self renderPanelBodyOn: canvas ].	"script:
                (canvas jQuery this slimScroll
                    height: '100 px';
                    alwaysVisible;
                    railVisible;
                    railColor: 'rgba(0,0,0,0.5)';
                    yourself);"
          canvas adminLTEBoxFooter with: [ self renderPanelFooterOn: canvas ] ]
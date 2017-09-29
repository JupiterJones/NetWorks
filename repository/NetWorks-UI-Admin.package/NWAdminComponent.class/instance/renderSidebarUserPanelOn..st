rendering-sidebar
renderSidebarUserPanelOn: canvas
  canvas div
    tbsPullLeft;
    class: 'image';
    with: [ 
          canvas tbsImage
            beCircle;
            url:
                (self session user avatar
                    ifNil: [ NWFileLibrary / #'imagesuserSvg' ]
                    ifNotNil: [ :avatar | avatar url ]) ].
  canvas div
    tbsPullLeft;
    class: 'info';
    with: [ 
          canvas paragraph: self session user title.
          canvas anchor
            with: [ 
              (canvas tag: 'i')
                fontAwesome;
                fontAwesomeCircleIcon;
                class: 'text-success'.
              canvas text: ' Online' ] ]
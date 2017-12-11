navbar
userNavbarMenu
  | menu |
  menu := AdminLTEUserNavbarItem new
    icon: #'user';
    label: [ self session user title ];
    cssClass: 'user user-menu';
    menuHeader: [ :canvas | 
          canvas tbsImage
            beCircle;
            url:
                (self session user avatar
                    ifNil: [ NWFileLibrary / #'imagesuserSvg' ]
                    ifNotNil: [ :avatar | avatar url ]).
          canvas
            paragraph: [ 
              canvas text: self session user title.
              canvas small: 'Comment about the user' ] ];
    menuFooter: [ :canvas | 
          canvas
            tbsForm: [ 
              canvas div
                tbsPullLeft;
                with: [ 
                      canvas tbsButton
                        beDefault;
                        callback: [ 
                              self rootAnnouncer
                                announce:
                                  (AdminLTEPanelSelected panel: (self panelOfType: NWUsersPanel)) ];
                        with: 'Profile' ].
              canvas div
                tbsPullRight;
                with: [ 
                      canvas tbsButton
                        beDefault;
                        callback: [ 
                              self session
                                logout;
                                redirect ];
                        with: 'Sign Out' ] ] ];
    menuItems: nil;
    menuContent: nil;
    yourself.
  ^ menu
install
install
  | application |
  application := WAAdmin register: self asApplicationAt: 'NetWorks'.
  application
    preferenceAt: #'sessionClass' put: NWSession;
    addLibrary: JQ2DevelopmentLibrary;
    addLibrary: JQUiDevelopmentLibrary;
    addLibrary: JQOvercastTheme;
    addLibrary: TBSDevelopmentLibrary;
    addLibrary: TBSJasnyDevelopmentLibrary;
    addLibrary: InfoVisDevelopmentLibrary;
    addLibrary: FAWDevelopmentLibrary;
    addLibrary: JQSlimScrollLibrary;
    addLibrary: JQFullCalendarFileLibrary;
    addLibrary: AdminLTEFileLibrary;
    addLibrary: NWFileLibrary
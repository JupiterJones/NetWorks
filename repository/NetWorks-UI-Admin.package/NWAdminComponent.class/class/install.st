setup
install
  "NWAdminComponent install"

  | application |
  application := WAAdmin register: self asApplicationAt: 'NetWorksAdmin'.
  application
    preferenceAt: #'sessionClass' put: NWSession;
    addLibrary: JQ2DevelopmentLibrary;
    addLibrary: TBSDevelopmentLibrary;
    addLibrary: TBSJasnyDevelopmentLibrary;
    addLibrary: FAWDevelopmentLibrary;
    addLibrary: JQSlimScrollLibrary;
    addLibrary: AdminLTEFileLibrary;
    addLibrary: NWFileLibrary.
  WAAdmin
    register: NWNginxAuthRequestHandler
    at: 'nginxAuth'
    in: WAAdmin defaultDispatcher
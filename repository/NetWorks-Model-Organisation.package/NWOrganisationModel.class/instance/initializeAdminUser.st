initialisation
initializeAdminUser
  | domainName |
  domainName := (ReadStream on: organisation dnsName)
    upTo: $.;
    upToEnd.
  users
    add:
      (NWUser new
        title: 'Administrator';
        userName: 'admin@' , domainName;
        password: 'admin';
        addPermission: NWPermission adminPermission;
        enabled: true;
        yourself)
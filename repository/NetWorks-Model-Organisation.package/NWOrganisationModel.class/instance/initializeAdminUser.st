initialisation
initializeAdminUser
  users
    add:
      (NWUser new
        title: 'Administrator';
        userName: 'admin@' , organisation dnsName;
        password: 'admin';
        addPermission: NWPermission adminPermission;
        enabled: true;
        yourself)
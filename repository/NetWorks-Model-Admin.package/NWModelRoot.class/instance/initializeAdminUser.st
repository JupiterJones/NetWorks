accessing
initializeAdminUser
  users
    add:
      (NWUser new
        title: 'Administrator';
        userName: 'admin@networks.dev';
        password: 'admin';
        addPermission: NWPermission adminPermission;
        enabled: true;
        yourself)
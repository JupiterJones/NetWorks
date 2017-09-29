initialisation
initialize
  super initialize.
  self
    addPanel: NWOrganisationsPanel new;
    addPanel: NWUsersPanel new;
    addNavbarItem: self userNavbarMenu
initialisation
initialize
  super initialize.
  user := NWUser new
    addPermission: NWContractorPermission new;
    organisation: NWCurrentOrganisation value;
    yourself.
  jobTypes := OrderedCollection new.
  clients := OrderedCollection new
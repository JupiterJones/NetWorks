initialisation
initialize
  super initialize.
  model := NWOrganisationModel new
    organisation: self;
    yourself.
  enabled := false
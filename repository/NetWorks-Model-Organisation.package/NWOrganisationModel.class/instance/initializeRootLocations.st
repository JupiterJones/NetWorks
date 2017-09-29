initialisation
initializeRootLocations
  | root |
  locations
    add:
      (root := NWLocation new
        title: 'Australia';
        yourself).
  root locations
    add:
        (NWLocation new
            title: 'New South Wales';
            yourself);
    add:
        (NWLocation new
            title: 'Queensland';
            yourself);
    add:
        (NWLocation new
            title: 'Victoria';
            yourself)
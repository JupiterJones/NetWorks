initialisation
initialize
  self install.
  NWExternalFileModel
    baseDirectory: NWAdmin webUploadsDirectory;
    baseUrl: 'http://nwadmin.dev/files/uploads'
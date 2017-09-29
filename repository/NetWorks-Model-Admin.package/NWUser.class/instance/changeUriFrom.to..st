magritte-hooks
changeUriFrom: oldUri to: newUri
  super changeUriFrom: oldUri to: newUri.
  NWAdmin
    updateDirectoryNameFrom: oldUri
    to: newUri
    inDirectory: self parentDirectory
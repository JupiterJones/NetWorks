webdav
updatePrivateCloudDirectoryFrom: oldName to: newName
  self
    updateDirectoryNameFrom: oldName
    to: newName
    inDirectory: self privateCloudDirectory
base directories
tempUploadDirectory
  ^ (self privateCloudDirectory directoryNamed: 'tmp') assureExistence
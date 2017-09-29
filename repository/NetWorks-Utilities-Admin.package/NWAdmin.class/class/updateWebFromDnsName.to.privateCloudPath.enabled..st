nginx
updateWebFromDnsName: oldDnsName to: newDnsName privateCloudPath: cloudPath enabled: isEnabled
  "If old name is not nil then remove old configuration. If newDnsName is not nil then create a new nginx configuration.
   finally reload nginx"

  oldDnsName ifNotNil: [ self removeNginxConfigurationForDnsName: oldDnsName ].
  newDnsName
    ifNotNil: [ 
      self
        createNginxConfigurationForDnsName: newDnsName
        privateCloudPath: cloudPath
        enabled: isEnabled ].
  self reloadNginx
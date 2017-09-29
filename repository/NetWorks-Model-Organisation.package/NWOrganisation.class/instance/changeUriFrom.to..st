private
changeUriFrom: oldUri to: newUri
  super changeUriFrom: oldUri to: newUri.
  NWAdmin
    updatePrivateCloudDirectoryFrom: (oldUri ifNil: [ self idString36 ])
    to: newUri.
  NWAdmin
    updateWebFromDnsName: dnsName
    to: dnsName
    privateCloudPath: newUri
    enabled: enabled
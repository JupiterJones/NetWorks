magritte-hooks
hasBeenRemoved
  "Remove NGINX Configuration"

  NWAdmin
    updateWebFromDnsName: dnsName
      to: nil
      privateCloudPath: nil
      enabled: false;
    updatePrivateCloudDirectoryFrom: self uri to: nil
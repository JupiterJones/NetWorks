magritte-hooks
hasChanged: changesDictionary
  "If the title has changed, update the"

  super hasChanged: changesDictionary.
  (changesDictionary at: self dnsNameDescription ifAbsent: [ nil ])
    ifNotNil: [ :dnsNameChanges | 
      NWAdmin
        updateWebFromDnsName: dnsNameChanges first
        to: dnsNameChanges last
        privateCloudPath: self uri
        enabled: enabled ].
  (changesDictionary at: self enabledDescription ifAbsent: [ nil ])
    ifNotNil: [ :enabledChanges | 
      NWAdmin
        updateWebFromDnsName: dnsName
        to: dnsName
        privateCloudPath: self uri
        enabled: enabledChanges last ]
hooks
initialRequest: aRequest
  super initialRequest: aRequest.
  [ 
  organisation := NWModelRoot instance organisationWithDnsName: aRequest host.
  self session model: organisation model ]
    on: Error
    do: [ :error | 
      "Show an error page saying there's no organisation on this url"
      GRPlatform current
        doTransaction: [ (ObjectLogEntry info: 'NW ERROR' object: aRequest host) addToLog ] ]
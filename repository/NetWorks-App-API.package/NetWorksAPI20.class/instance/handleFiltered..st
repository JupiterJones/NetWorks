request handling
handleFiltered: aRequestContext
  GRPlatform current
    doTransaction: [ 
      (ObjectLogEntry
        info: 'NetWorks API ' , aRequestContext request url asString
        object: aRequestContext request authorization) addToLog ].
  super handleFiltered: aRequestContext
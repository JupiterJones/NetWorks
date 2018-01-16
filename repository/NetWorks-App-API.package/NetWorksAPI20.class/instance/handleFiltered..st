as yet unclassified
handleFiltered: aRequestContext
  GRPlatform current
    doTransaction: [ 
      (ObjectLogEntry
        info: 'NetWorks API ' , aRequestContext request url asString
        object:
          {(aRequestContext request session).
          (aRequestContext request authorization)})
        addToLog ].
  super handleFiltered: aRequestContext
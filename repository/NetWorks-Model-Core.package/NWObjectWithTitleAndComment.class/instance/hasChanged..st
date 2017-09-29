magritte-hooks
hasChanged: changesDictionary
  "If the title has changed, update the URI"

  (changesDictionary at: self titleDescription ifAbsent: [ nil ])
    ifNotNil: [ :titleChanges | 
      self
        changeUriFrom:
          (self validUriFrom: (titleChanges first ifNil: [ self idString36 ]))
        to: (self validUriFrom: titleChanges last) ]
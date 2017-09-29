accessing
instance: restoredInstance
  "Replace the online instance with restoredInstance"

  (restoredInstance isKindOf: self)
    ifTrue: [ instance := restoredInstance ]
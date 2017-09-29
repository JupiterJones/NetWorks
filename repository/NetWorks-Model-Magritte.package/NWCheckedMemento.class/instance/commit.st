actions
commit
  | changes |
  changes := self differenceBetween: self original to: self cache.
  super commit.
  changes notEmpty
    ifTrue: [ self model hasChanged: changes ]
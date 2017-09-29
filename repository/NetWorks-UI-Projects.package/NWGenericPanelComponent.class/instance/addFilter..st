actions
addFilter: filter
  filters add: filter.
  filters size == 1
    ifTrue: [ filters first isActive: true ]
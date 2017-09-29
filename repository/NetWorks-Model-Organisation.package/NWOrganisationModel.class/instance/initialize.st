initialisation
initialize
  super initialize.
  users := OrderedCollection new.
  clients := OrderedCollection new.
  projects := OrderedCollection new.
  assets := OrderedCollection new.
  locations := OrderedCollection new.
  contractors := OrderedCollection new.
  jobTypes := OrderedCollection new.
  testTypes := OrderedCollection new.
  variations := OrderedCollection new.
  workflows := OrderedCollection new.
  self
    initializeRootAsset;
    initializeRootLocations
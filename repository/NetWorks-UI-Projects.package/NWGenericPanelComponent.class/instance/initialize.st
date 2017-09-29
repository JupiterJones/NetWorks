initialisation
initialize
  super initialize.
  hasSearch := false.
  searchText := ''.
  filters := OrderedCollection new.
  announcer := Announcer new
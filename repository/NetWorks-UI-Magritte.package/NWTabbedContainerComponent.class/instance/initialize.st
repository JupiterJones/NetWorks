initialisation
initialize
  super initialize.
  announcer := Announcer new.
  announcer
    subscribe: NWTabSelected
    do: [ :ann | selectedTab := ann tab ]
    for: self
as yet unclassified
timeList
  | x |
  x := OrderedCollection new.
  (event start midnight to: event end midnight + 1 day)
    every: 30 minutes
    do: [ :each | x add: each asTime ].
  ^ x
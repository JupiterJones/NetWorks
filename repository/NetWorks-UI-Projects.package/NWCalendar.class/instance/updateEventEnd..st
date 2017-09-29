as yet unclassified
updateEventEnd: eventData
  | anEvent dur |
  dur := eventData second asNumber days.
  dur := dur + eventData third asNumber hours.
  dur := dur + eventData fourth asNumber minutes.
  anEvent := (self events select: [ :each | each asOop = eventData first ])
    first.
  anEvent duration: anEvent duration + dur
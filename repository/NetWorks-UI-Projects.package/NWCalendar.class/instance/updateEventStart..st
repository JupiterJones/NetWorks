as yet unclassified
updateEventStart: eventData
  | event dur |
  dur := eventData second asNumber days.
  dur := dur + eventData third asNumber hours.
  dur := dur + eventData fourth asNumber minutes.
  event := self events detect: [ :each | each asOop = eventData first ].
  event scheduleDate: event scheduleDate + dur
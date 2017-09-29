initialisation
initialize
  super initialize.
  workflow := NWWorkflow initialStatus.
  scheduleDuration := 5 days.
  lineItems := OrderedCollection new
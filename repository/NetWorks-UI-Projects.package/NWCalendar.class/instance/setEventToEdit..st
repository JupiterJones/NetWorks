as yet unclassified
setEventToEdit: anEventId
  | anEvent |
  anEvent := (self events select: [ :each | each asOop = anEventId ]) first.
  self components
    at: #'workOrder'
    put: (self buildWorkOrderComponentFor: anEvent)
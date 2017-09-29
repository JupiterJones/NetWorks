as yet unclassified
eventEditor
  ^ self componentAt: #'eventEditor' ifAbsentPut: [ NWCalendarEventEditor new ]
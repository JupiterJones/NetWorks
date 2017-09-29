as yet unclassified
setEventToCreate: newEventData
  | aNewEvent |
  aNewEvent := NWFullCalendarEvent new
    start: newEventData first asDateAndTime;
    end: newEventData second asDateAndTime.
  eventEditor := NWCalendarEventEditor new.
  ^ self eventEditor
    calendar: self;
    event: aNewEvent;
    edit: false;
    yourself
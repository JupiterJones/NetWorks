converting
asCalendarEvent
  "Answer a CMFullCalendarEvent representing this WorkOrder"

  ^ NWFullCalendarEvent new
    id: self asOop;
    title:
        (String
            streamContents: [ :stream | 
              stream nextPutAll: self title.
              self contractor
                ifNotNil: [ 
                  stream
                    nextPutAll: ' (';
                    nextPutAll: self contractor title;
                    nextPutAll: ')' ] ]);
    workOrder: self;
    allDay: true;
    start: self scheduleDate;
    end: self scheduleDate + self scheduleDuration;
    yourself
as yet unclassified
renderCalendar: html
  self events removeAllSuchThat: [ :ea | ea isNil ].
  html div
    id: 'calendar';
    script:
        (html jQuery this fullCalendar
            theme: true;
            selectable: true;
            selectHelper: true;
            defaultView: 'month';
            unselectCancel: '.event-editor';
            header: self header;
            height: 450;
            droppable: true;
            dropAccept: '.cal-drop';
            eventsJsonGet: [ :start :end | self calendarEventsFromStartDate: start to: end ];
            onDrop:
                (html jQuery ajax
                    callback: [ :eventData | 
                          "noop"
                          droppedObject := eventData ]
                      json:
                        (JSStream on: 'new Array(date,this.getAttribute("oid"))');
                    script: [ :s | 
                          announcer
                            announce:
                              (NWObjectsDropped
                                script: s
                                objects:
                                  {(Object _objectForOop: droppedObject last asNumber)}
                                targetObject: droppedObject first asDateAndTime).
                          droppedObject := nil ]);
            onEventClick:
                (html jQuery ajax
                    callback: [ :anEventId | self setEventToEdit: anEventId ]
                      json: (JSStream on: 'calEvent.id');
                    script: [ :s | 
                          s << (s jQuery class: 'content')
                            html: [ :h | 
                              isEditing := true.
                              h render: self workOrderComponent ] ]);
            onEventDrop:
                (html jQuery ajax
                    callback: [ :eventData | self updateEventStart: eventData ]
                    json:
                      (JSStream on: 'new Array(event.id,delta.days(),delta.hours(),delta.minutes())'));
            onEventResize:
                (html jQuery ajax
                    callback: [ :eventData | self updateEventEnd: eventData ]
                    json:
                      (JSStream on: 'new Array(event.id,delta.days(),delta.hours(),delta.minutes())'));
            onSelect:
                (html jQuery id: 'eventEditor') dialog open
                    ,
                      (html jQuery ajax
                        callback: [ :newEventData | self setEventToCreate: newEventData ]
                          json: (JSStream on: 'new Array(start,end)');
                        script: [ :s | 
                              s << (s jQuery id: 'event-editor')
                                replaceWith: [ :h | h render: self eventEditor ] ]))
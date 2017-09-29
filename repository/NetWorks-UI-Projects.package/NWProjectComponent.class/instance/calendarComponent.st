components
calendarComponent
  ^ self components
    at: #'calendar'
    ifAbsentPut: [ 
      NWCalendar new
        events:
            (self project jobs
                ifEmpty: [ #() ]
                ifNotEmpty: [ :jobs | jobs first workOrders ]);
        subscribe: NWObjectsDropped
          do: [ :ann | self workOrdersDroppedOnCalendar: ann ]
          for: self;
        yourself ]
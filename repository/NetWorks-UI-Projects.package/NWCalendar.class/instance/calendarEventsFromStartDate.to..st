as yet unclassified
calendarEventsFromStartDate: start to: end
  | workOrders |
  workOrders := self events
    select: [ :workOrder | workOrder scheduleDate notNil ].
  start
    ifNotNil: [ workOrders := workOrders select: [ :workOrder | start < workOrder scheduleDate ] ].
  end
    ifNotNil: [ workOrders := workOrders select: [ :workOrder | workOrder scheduleDate < end ] ].
  ^ workOrders collect: [ :workOrder | workOrder asCalendarEvent ]
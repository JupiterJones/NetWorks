scripts
refreshCalendarOnScript: script
  script << (script jQuery id: 'calendar')
    call: 'fullCalendar'
    with: 'refetchEvents'
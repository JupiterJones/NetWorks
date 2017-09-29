accessing
header
  | head |
  head := Dictionary new.
  head at: 'left' put: 'prev,today,next'.
  head at: 'center' put: 'title'.
  head at: 'right' put: 'month,agendaWeek,agendaDay'.
  ^ head
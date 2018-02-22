defaults
all
  ^ {(self find: 'Unscheduled').
  (self find: 'Assigned').
  (self find: 'Scheduled').
  (self find: 'Started').
  (self find: 'Completed').
  (self find: 'Invoiced').
  (self find: 'Closed')}
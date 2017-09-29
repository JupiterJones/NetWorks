defaults
initializeStatus
  | unscheduled assigned scheduled started completed invoiced closed |
  initialStatus := unscheduled := self new
    title: 'Unscheduled';
    comment: 'New jobs and work orders have an initial status of "Unscheduled"';
    yourself.
  assigned := self new
    title: 'Assigned';
    comment:
        'Once a work order has been created for a job and assigned to a contractor, the status for both become "Assigned"';
    yourself.
  scheduled := self new
    title: 'Scheduled';
    comment:
        'Once a work order has a date attached to it, the work order and job stats becomes "Scheduled"';
    yourself.
  started := self new
    title: 'Started';
    comment:
        'Once a contractor starts work on a work order, the work order and job stats becomes "Started"';
    yourself.
  completed := self new
    title: 'Completed';
    comment:
        'When the contractor completes a work order, the status becomes "Completed"';
    yourself.
  invoiced := self new
    title: 'Invoiced';
    comment:
        'When an invoice has been created for a completed work order, the status becomes "Invoiced"';
    yourself.
  closed := self new
    title: 'Closed';
    comment:
        'Once an invoice is paid for a work order, the status becomes "Closed"';
    yourself.
  unscheduled next: assigned.
  assigned
    next: scheduled;
    previous: unscheduled.
  scheduled
    next: started;
    previous: assigned.
  started
    next: completed;
    previous: scheduled.
  completed
    next: invoiced;
    previous: started.
  invoiced
    next: closed;
    previous: completed.
  closed previous: invoiced.
  ^ initialStatus
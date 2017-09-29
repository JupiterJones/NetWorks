accessing
start
  ^ (self workOrder scheduleDate ifNil: [ DateAndTime now ]) asDateAndTime
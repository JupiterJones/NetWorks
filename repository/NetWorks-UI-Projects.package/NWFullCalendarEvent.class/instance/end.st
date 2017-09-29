accessing
end
  ^ ((self workOrder scheduleDate ifNil: [ DateAndTime now ])
    + self workOrder scheduleDuration) asDateAndTime
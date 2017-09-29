authorisations
clearExpiredAuthorisations
  authorisations := self authorisations
    select: [ :authorisation | (authorisation at: #'expiryTime') >= DateAndTime now ]
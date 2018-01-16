accessing
user
  ^ WACurrentRequestContext value session
    ifNotNil: [ :session | session user ]
    ifNil: [ NWCurrentContractor value user ]
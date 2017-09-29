defaults
initialStatus
  ^ initialStatus ifNil: [ self initializeStatus ]
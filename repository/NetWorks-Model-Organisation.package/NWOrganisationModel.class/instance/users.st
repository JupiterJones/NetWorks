accessing
users
  users ifEmpty: [ self initializeAdminUser ].
  ^ users
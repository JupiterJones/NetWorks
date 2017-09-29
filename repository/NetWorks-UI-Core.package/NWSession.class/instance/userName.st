accessing
userName
  self ifLoggedIn: [ ^ self user userName ].
  ^ 'No user logged on'
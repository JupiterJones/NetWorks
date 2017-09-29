permissions
isAdmin
  ^ (permissions detect: [ :permission | permission isAdmin ] ifNone: [ nil ])
    notNil
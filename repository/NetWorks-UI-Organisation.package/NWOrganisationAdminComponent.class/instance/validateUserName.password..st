actions
validateUserName: userName password: password
  "Override to manage login from login widget"

  self session
    user:
      (self model users
        detect: [ :user | 
          user userName greaseString asLowercase = userName greaseString asLowercase
            and: [ user validatePassword: password ] ]
        ifNone: [ 
          self loginError: 'The email address password combination was not found'.
          nil ])
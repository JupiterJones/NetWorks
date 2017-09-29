actions
validatePassword: password
  password ifNil: [ ^ false ].
  ^ self securePassword
    = (PasswordSaltAndStretch hashForPassword: password r: 1024 s: self salt)
accessing
contractor
  "Return the contractor related to the signed in user"

  ^ self contractors
    detect: [ :contractor | contractor user == self user ]
    ifNone: [ nil ]
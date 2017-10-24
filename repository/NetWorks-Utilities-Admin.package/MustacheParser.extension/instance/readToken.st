*NetWorks-Utilities-Admin
readToken
  | token |
  stream next: self startDelimiter size - 1.
  token := (stream upToAll: self endDelimiter) trimBoth.
  stream next: self startDelimiter size - 1.
  ^ token
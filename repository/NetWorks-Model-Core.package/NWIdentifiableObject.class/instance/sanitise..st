private
sanitise: aStringOrSymbol
  | sanitisedString |
  aStringOrSymbol ifNil: [ ^ nil ].
  sanitisedString := ''.
  aStringOrSymbol replaceAll: $/ with: $_.
  aStringOrSymbol
    do: [ :char | 
      (char isAlphaNumeric or: [ '-_' includes: char ])
        ifTrue: [ sanitisedString := sanitisedString copyWith: char ] ].
  ^ sanitisedString
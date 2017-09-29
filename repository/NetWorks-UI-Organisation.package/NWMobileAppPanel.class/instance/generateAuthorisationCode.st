actions
generateAuthorisationCode
  "Generate authCode and apiKey"

  | apiKey |
  apiKey := UUID new asString.
  code := 9999 atRandom printPaddedWith: $0 to: 4.
  NWModelRoot instance
    registerAuthCode: code
    apiKey: apiKey
    contractor: self model contractor
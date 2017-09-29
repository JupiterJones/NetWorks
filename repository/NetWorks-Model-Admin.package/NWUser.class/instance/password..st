accessing
password: password
  "password needs to be stored in two ways:
   1. high security (unrecoverable passwords), 
   2. basic HTTP authorisation (ie. for webdav)"

  | salt |
  self
    attributeAt: self saltDescription
      put: (salt := SecureRandom picker nextBytesNonZero: 64);
    attributeAt: self securePasswordDescription
      put: (PasswordSaltAndStretch hashForPassword: password r: 1024 s: salt);
    attributeAt: self cryptPasswordDescription
      put: (ZnUtils encodeBase64: userName asString , ':' , password asString)
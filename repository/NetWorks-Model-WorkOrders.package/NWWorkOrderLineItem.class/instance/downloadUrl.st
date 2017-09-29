file system
downloadUrl
  | baseDirectory |
  baseDirectory := self model organisation fileDirectory.
  ^ 'http://' , self model organisation dnsName , '/'
    , self model organisation uri
    ,
      (self fileDirectory pathString
        copyFrom: baseDirectory pathString size + 1
        to: self fileDirectory pathString size)
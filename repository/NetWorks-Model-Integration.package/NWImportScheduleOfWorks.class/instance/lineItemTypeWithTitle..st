private
lineItemTypeWithTitle: title
  "NOTE: lineItemType needs to take into account the client"

  self model jobTypes
    do: [ :jobType | 
      (jobType lineItemTypes
        detect: [ :lineItemType | lineItemType title = title and: [ lineItemType clients includes: client ] ]
        ifNone: [ nil ]) ifNotNil: [ :lineItemType | ^ lineItemType ] ].
  ^ nil
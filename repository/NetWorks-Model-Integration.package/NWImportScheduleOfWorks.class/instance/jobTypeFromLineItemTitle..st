private
jobTypeFromLineItemTitle: title
  self model jobTypes
    do: [ :jobType | 
      (jobType lineItemTypes
        detect: [ :lineItemType | lineItemType title = title ]
        ifNone: [ nil ]) ifNotNil: [ ^ jobType ] ].
  ^ nil
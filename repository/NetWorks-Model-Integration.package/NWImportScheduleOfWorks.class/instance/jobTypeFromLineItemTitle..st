private
jobTypeFromLineItemTitle: title
  self model jobTypes
    do: [ :jobType | 
      | lineItemTypeTitle |
      lineItemTypeTitle := (title includes: $/)
        ifFalse: [ title ]
        ifTrue: [ title replaceAll: $/ with: $_ ].
      (jobType lineItemTypes
        detect: [ :lineItemType | lineItemType title = lineItemTypeTitle ]
        ifNone: [ nil ]) ifNotNil: [ ^ jobType ] ].
  ^ nil
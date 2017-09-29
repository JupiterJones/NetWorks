private
generateUri
  ^ self validUriFrom: (title ifNil: [ self idString36 ])
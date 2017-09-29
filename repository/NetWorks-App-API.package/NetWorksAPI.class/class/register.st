register
register
  self subclasses
    do: [ :apiClass | WAAdmin register: apiClass at: 'NetWorksAPI/' , apiClass apiVersion asString ]
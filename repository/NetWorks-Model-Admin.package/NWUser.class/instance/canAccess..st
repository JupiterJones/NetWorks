permissions
canAccess: aResource
  self permissions
    detect: [ :permission | permission allowsAccessTo: aResource ]
    ifNone: [ ^ false ].
  ^ true
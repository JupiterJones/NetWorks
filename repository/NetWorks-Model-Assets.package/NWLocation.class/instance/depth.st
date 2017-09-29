accessing
depth
  "Answer the depth of this level in the hierarchy"

  ^ parent ifNil: [ 1 ] ifNotNil: [ parent depth + 1 ]
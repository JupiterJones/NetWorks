accessing
accessiblePanels
  "Answer the subset of panels this current userhas permissions for"

  ^ panels select: [ :panel | panel canBeAccessedByUser: self session user ]
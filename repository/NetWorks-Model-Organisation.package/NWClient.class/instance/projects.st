accessing
projects
  ^ self organisation model projects
    select: [ :project | project client == self ]
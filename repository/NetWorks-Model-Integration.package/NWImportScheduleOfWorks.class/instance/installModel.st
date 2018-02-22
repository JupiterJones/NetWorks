private
installModel
  project jobs: jobs.
  (self model projects includes: project)
    ifFalse: [ self model projects add: project ].
  self model assets first assets addAll: assets
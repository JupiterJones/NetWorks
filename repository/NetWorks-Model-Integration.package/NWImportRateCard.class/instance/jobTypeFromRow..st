private
jobTypeFromRow: row
  | title |
  ^ (title := row at: #'jobType' ifAbsent: [ nil ])
    ifNotNil: [ 
      self model jobTypes
        detect: [ :jt | jt title = title ]
        ifNone: [ 
          self model jobTypes
            add:
              (NWJobType new
                title: title;
                yourself) ] ]
scripts
renderJobsOnScript: script
  script << (script jQuery class: 'jobsList')
    html: [ :html | html render: self jobListComponent ]
convenience
allJobs
  ^ self projects
    inject: Set new
    into: [ :allJobs :project | 
      allJobs
        addAll: project jobs;
        yourself ]
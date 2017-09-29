convenience
jobWithId: anId
  ^ self allJobs detect: [ :job | job id = anId ] ifNone: [ nil ]
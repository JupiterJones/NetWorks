tests
testAddJob
  | job |
  self assert: model jobs isEmpty.
  job := NWJob new.
  model jobs add: job.
  self assert: model jobs anyOne == job
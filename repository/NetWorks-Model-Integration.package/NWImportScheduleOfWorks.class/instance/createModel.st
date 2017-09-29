private
createModel
  assets := OrderedCollection new.
  self
    createClient;
    createProject;
    createJobs
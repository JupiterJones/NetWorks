model object
project: project
  self
    object: [ 
      self
        key: 'id' value: project id asString;
        key: 'title' value: project title;
        key: 'comment' value: project comment	"key: 'jobs'
          value: [ self array: [ project jobs do: [ :job | self job: job ] ] ]" ]
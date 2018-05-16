model object
job: job
  self
    object: [ 
      self
        key: 'id' value: job id asString;
        key: 'title' value: job title;
        key: 'comment' value: job comment;
        key: 'location' value: [ self location: job location ];
        key: 'asset' value: job asset;
        key: 'uri' value: job uri ]
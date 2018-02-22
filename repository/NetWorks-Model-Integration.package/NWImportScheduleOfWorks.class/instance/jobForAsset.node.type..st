private
jobForAsset: asset node: node type: jobType
  "Default to top level location - TODO: Work out what this should be"

  ^ jobs
    detect: [ :j | j title = asset ]
    ifNone: [ 
      jobs
        add:
          (NWJob new
            title: asset;
            comment: 'Node: ' , node;
            project: project;
            jobType: jobType;
            asset: asset;
            location: self model locations anyOne;
            yourself) ]
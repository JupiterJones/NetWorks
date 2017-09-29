private
jobForAsset: asset node: node type: jobType
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
            asset: (self assetForAsset: asset node: node);
            yourself) ]
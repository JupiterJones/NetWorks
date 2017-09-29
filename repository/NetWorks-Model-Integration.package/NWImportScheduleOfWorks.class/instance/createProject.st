private
createProject
  assetPrefix := (ReadStream on: ((rows at: 3) at: #'sorCode')) upTo: $:.
  project := self model projects
    detect: [ :p | p title = assetPrefix ]
    ifNone: [ 
      NWProject new
        title: assetPrefix;
        client: client;
        yourself ]
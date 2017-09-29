private
assetWithTitle: title
  ^ assets
    detect: [ :asset | asset title = title ]
    ifNone: [ 
      assets
        add:
          (NWAsset new
            title: title;
            yourself) ]
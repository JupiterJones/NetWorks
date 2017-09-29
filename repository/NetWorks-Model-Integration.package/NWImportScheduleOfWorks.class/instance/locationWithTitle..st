private
locationWithTitle: title
  ^ locations
    detect: [ :location | location title = title ]
    ifNone: [ 
      assets
        add:
          (NWLocation new
            title: title;
            yourself) ]
file system
avatarFullUrl
  ^ avatar
    ifNotNil: [ 
      self avatarUrl
        addToPath: avatar filename;
        yourself ]
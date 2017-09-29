rendering
renderContractorProfile: contractor on: canvas
  "Render the Contractor profile"

  canvas
    object: [ 
      canvas name: 'NetWorks API'.
      contractor
        ifNotNil: [ 
          canvas
            key: 'contractor'
            value: [ 
              canvas
                object: [ 
                  canvas
                    key: 'title' value: contractor title;
                    key: 'email' value: contractor email;
                    key: 'avatarUrl' value: contractor avatarFullUrl ] ] ] ]
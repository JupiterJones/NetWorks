rendering
renderApiKey: apiKey organisation: organisation logo: logo on: canvas
  "Render the NetWorks apiKey"

  canvas
    object: [ 
      canvas name: 'NetWorks API'.
      apiKey
        ifNotNil: [ 
          canvas
            key: 'apiKey' value: apiKey;
            key: 'organisation' value: organisation;
            key: 'logo' value: logo ] ]
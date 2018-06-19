rendering
renderApiKey: apiKey organisation: organisation logo: logo on: canvas
  "Render the NetWorks apiKey"

  canvas
    object: [ 
      apiKey
        ifNotNil: [ 
          canvas
            key: 'apiKey' value: apiKey;
            key: 'organisation' value: organisation;
            key: 'logo' value: logo ] ]
json
jsonUrlFor: aBlock canvas: canvas
  ^ canvas
    urlForInfoVisJsonCallback: [ 
      self requestContext
        respond: [ :response | 
          response
            cacheFor:
                (Duration
                    days: 0
                    hours: 0
                    minutes: 0
                    seconds: 1);
            document: aBlock value mimeType: WAMimeType textJavascript ] ]
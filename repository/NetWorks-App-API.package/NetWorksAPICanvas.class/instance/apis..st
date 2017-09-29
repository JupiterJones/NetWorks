information object
apis: apiClasses
  self
    key: 'apis'
    value: [ 
      self
        array: [ 
          apiClasses
            do: [ :apiClass | 
              self
                object: [ 
                  self
                    key: 'version' value: apiClass apiVersion;
                    key: 'baseUrl'
                      value:
                        WACurrentRequestContext value request host , '/NetWorksAPI/'
                            , apiClass apiVersion asString;
                    key: 'appVersions' value: apiClass appVersions ] ] ] ]
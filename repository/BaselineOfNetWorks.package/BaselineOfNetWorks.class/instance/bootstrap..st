baseline
bootstrap: spec
  spec
    for: #'common'
    do: [ 
      spec
        configuration: 'Bootstrap'
        with: [ 
          spec
            repository:
                'http://smalltalkhub.com/mc/TorstenBergmann/Bootstrap/main';
            version: '0.16.0' ].
      spec
        configuration: 'BootstrapMagritte'
        with: [ 
          spec
            repository:
                'http://www.smalltalkhub.com/mc/TorstenBergmann/BootstrapMagritte/main';
            version: '0.2.3' ] ]
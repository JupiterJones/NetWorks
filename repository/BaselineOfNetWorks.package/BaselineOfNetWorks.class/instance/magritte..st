baseline
magritte: spec
  spec
    for: #'common'
    do: [ 
      spec
        configuration: 'Magritte3'
        with: [ 
          spec
            repository: 'http://www.smalltalkhub.com/mc/Magritte/Magritte3/main';
            version: '3.5.1' ].
      spec
        configuration: 'Magritte3AddOns'
        with: [ 
          spec
            repository:
                'http://www.smalltalkhub.com/mc/Magritte/Magritte3Addons/main';
            version: '3.1.3' ] ]
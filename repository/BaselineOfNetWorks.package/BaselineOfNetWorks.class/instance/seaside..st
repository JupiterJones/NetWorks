baseline
seaside: spec
  spec
    for: #'common'
    do: [ 
      spec
        baseline: 'Seaside3'
        with: [ 
          spec
            repository:
                'filetree:///opt/git/JupiterSmalltalk/Seaside/repository';
            loads: #('Core' 'Development' 'Zinc') ] ]
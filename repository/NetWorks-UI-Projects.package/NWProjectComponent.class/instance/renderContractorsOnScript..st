scripts
renderContractorsOnScript: script
  script << (script jQuery class: 'contractors')
    html: [ :html | html render: self contractorsComponent ]
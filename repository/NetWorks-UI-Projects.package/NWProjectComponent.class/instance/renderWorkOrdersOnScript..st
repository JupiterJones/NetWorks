scripts
renderWorkOrdersOnScript: script
  script << (script jQuery class: 'workOrderList')
    html: [ :html | html render: self workOrdersComponent ]
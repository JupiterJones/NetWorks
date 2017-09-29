scripts
renderWorkOrderLineItemsOnScript: script
  script << (script jQuery class: 'workOrderLineItems')
    html: [ :html | html render: self workOrderLineItemsComponent ]
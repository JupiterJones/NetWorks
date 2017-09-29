scripts
renderJobLineItemsOnScript: script
  script << (script jQuery class: 'jobLineItems')
    html: [ :html | html render: self jobLineItemsComponent ]
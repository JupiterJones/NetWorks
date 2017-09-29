scripts
setFocus: cssClass onScript: script
  "Remove existing focus and set focus on cssClass"

  script << (script jQuery: '.jobs > div, .workOrders > div')
    removeClass: 'focus'.
  script << (script jQuery: cssClass) addClass: 'focus'
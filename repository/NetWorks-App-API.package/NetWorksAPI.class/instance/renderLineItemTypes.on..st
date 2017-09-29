rendering
renderLineItemTypes: lineItemTypes on: canvas
  "Render the jobLineItemTypes"

  canvas
    object: [ 
      canvas name: 'NetWorks API'.
      canvas
        key: 'lineItemTypes'
        value: [ 
          canvas
            array: [ lineItemTypes do: [ :lineItemType | canvas lineItemType: lineItemType ] ] ] ]
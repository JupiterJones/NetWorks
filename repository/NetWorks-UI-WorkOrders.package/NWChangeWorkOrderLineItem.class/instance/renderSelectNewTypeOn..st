rendering
renderSelectNewTypeOn: canvas
  canvas div
    with: [ 
      canvas strong: 'Current Type: '.
      canvas
        text:
          self lineItem jobLineItemTypeTitle , ' - '
            , self lineItem jobLineItemTypeComment ].
  canvas horizontalRule.
  canvas strong: 'New Type:'.
  canvas select
    selected: lineItem jobLineItem lineItemType;
    callback: [ :newType | newLineItemType := newType ];
    labels: [ :lineItemType | lineItemType titleAndComment ];
    list: lineItem workOrder job jobType lineItemTypes
descriptions
jobLineItemDescription
  <magritteDescription>
  | description |
  description := MASingleOptionDescription new
    accessor: #'jobLineItem';
    options: self workOrder job lineItems;
    reference:
        NWJobLineItem new lineItemTypeTitleAndCommentDescription asContainer;
    label: 'Job Line Item';
    comment:
        'Select the Job Line Item that this Work Order Line Item is based on.';
    priority: 210;
    beRequired;
    yourself.
  self user isAdmin
    ifFalse: [ description beReadonly ].
  ^ description
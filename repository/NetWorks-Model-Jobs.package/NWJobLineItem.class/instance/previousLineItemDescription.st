descriptions
previousLineItemDescription
  <magritteDescription>
  ^ MAToOneRelationDescription new
    accessor: #'previousLineItem';
    reference: NWJobLineItem new lineItemTypeTitleDescription asContainer;
    label: 'Previous Job Line Item';
    comment:
        'If there is a value above this line, then this line item had it''s type changed by a contractor.';
    priority: 400;
    beReadonly;
    yourself
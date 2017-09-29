descriptions
lineItemTypeDescription
  <magritteDescription>
  | description template |
  template := NWJobLineItemType new.
  description := MASingleOptionDescription new
    accessor: #'lineItemType';
    options:
        (self job jobType lineItemTypes
            select: [ :lineItemType | lineItemType clients includes: self job project client ]);
    reference: template titleAndCommentDescription asContainer;
    label: 'Line Item Type';
    comment:
        'Select a line item type from the subset available for '
            , self job jobType title;
    priority: 100;
    beRequired;
    yourself.
  ^ description
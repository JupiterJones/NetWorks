descriptions
lineItemTypeTitleAndCommentDescription
  <magritteDescription>
  ^ MAStringDescription new
    accessor: #'lineItemTypeTitleAndComment';
    label: 'Type';
    priority: 100;
    beRequired;
    beReadonly;
    propertyAt: #'icon' put: #'listUnordered';
    yourself
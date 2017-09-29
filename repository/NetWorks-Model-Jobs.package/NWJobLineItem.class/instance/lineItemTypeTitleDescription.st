descriptions
lineItemTypeTitleDescription
  "<magritteDescription>"

  ^ MAStringDescription new
    accessor: #'lineItemTypeTitle';
    label: 'Line Item Type';
    priority: 100;
    beRequired;
    beReadonly;
    propertyAt: #'icon' put: #'listUnordered';
    yourself
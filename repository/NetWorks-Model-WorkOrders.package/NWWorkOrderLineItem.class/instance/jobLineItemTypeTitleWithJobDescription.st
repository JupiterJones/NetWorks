descriptions
jobLineItemTypeTitleWithJobDescription
  "<magritteDescription>"

  ^ MAStringDescription new
    accessor: #'jobLineItemTypeTitleWithJob';
    label: 'Line Item Type';
    priority: 100;
    beReadonly;
    propertyAt: #'icon' put: #'listUnordered';
    yourself
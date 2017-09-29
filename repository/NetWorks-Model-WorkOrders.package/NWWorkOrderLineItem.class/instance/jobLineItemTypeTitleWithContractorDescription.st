descriptions
jobLineItemTypeTitleWithContractorDescription
  "<magritteDescription>"

  ^ MAStringDescription new
    accessor: #'jobLineItemTypeTitleWithContractor';
    label: 'Line Item Type';
    priority: 100;
    beReadonly;
    propertyAt: #'icon' put: #'listUnordered';
    yourself
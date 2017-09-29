descriptions
quantityCompleteDescription
  "<magritteDescription>"

  ^ MANumberDescription new
    accessor: #'quantityComplete';
    label: 'Complete';
    priority: 350;
    beReadonly;
    propertyAt: #'icon' put: #'check';
    yourself
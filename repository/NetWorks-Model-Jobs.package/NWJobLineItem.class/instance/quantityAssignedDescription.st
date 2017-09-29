descriptions
quantityAssignedDescription
  "<magritteDescription>"

  ^ MANumberDescription new
    accessor: #'quantityAssigned';
    label: 'Assigned';
    priority: 300;
    beReadonly;
    propertyAt: #'icon' put: #'user';
    yourself
descriptions
percentageCompleteDescription
  "<magritteDescription>"

  ^ MANumberDescription new
    accessor: #'percentageComplete';
    label: '% Complete';
    priority: 300;
    beReadonly;
    beRequired;
    propertyAt: #'icon' put: #'tachometer';
    yourself
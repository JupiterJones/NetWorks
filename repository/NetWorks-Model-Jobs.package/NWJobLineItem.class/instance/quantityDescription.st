descriptions
quantityDescription
  <magritteDescription>
  ^ MANumberDescription new
    accessor: #'quantity';
    label: 'Quantity';
    priority: 200;
    propertyAt: #'icon' put: #'bullseye';
    bePositive;
    yourself
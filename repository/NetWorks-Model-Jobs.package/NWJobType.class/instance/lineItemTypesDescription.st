descriptions
lineItemTypesDescription
  <magritteDescription>
  | template |
  template := NWJobLineItemType new.
  ^ NWToManyRelationDescription new
    accessor: #'lineItemTypes';
    classes: {NWJobLineItemType};
    cssClass: 'reportComponent';
    label: 'Line Item Types';
    propertyAt: #'icon' put: 'wrench';
    reference: template titleDescription , template commentDescription;
    priority: 500;
    beSorted;
    yourself
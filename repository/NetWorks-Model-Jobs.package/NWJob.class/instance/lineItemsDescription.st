descriptions
lineItemsDescription
  <magritteDescription>
  | template |
  template := NWJobLineItem new.
  ^ NWToManyRelationDescription new
    accessor: #'lineItems';
    classes: {NWJobLineItem};
    reference:
        template lineItemTypeTitleAndCommentDescription , template quantityDescription
            , template quantityAssignedDescription
            , template quantityCompleteDescription;
    propertyAt: #'objectDecorationClasses' put: {AdminLTEBoxDecoration};
    label: 'Line Items';
    priority: 500;
    yourself
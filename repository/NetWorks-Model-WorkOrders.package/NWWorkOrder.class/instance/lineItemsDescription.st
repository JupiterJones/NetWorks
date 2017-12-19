descriptions
lineItemsDescription
  <magritteDescription>
  | template description |
  template := NWWorkOrderLineItem new.
  description := NWToManyRelationDescription new
    accessor: #'lineItems';
    classes: {NWWorkOrderLineItem};
    reference:
        template jobLineItemTypeTitleAndCommentDescription
            , template quantityDescription
            , template quantityCompleteDescription;
    propertyAt: #'objectDecorationClasses' put: {AdminLTEBoxDecoration};
    label: 'Line Items';
    priority: 1000;
    beSorted;
    yourself.	"self user isAdmin
    ifFalse: [ description beDefinitive ]."
  ^ description
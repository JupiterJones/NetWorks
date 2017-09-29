descriptions
jobLineItemTypeTitleDescription
  <magritteDescription>
  ^ MAStringDescription new
    accessor:
        (MAChainAccessor accessors: #(#'jobLineItem' #'lineItemType' #'title'));
    label: 'Type';
    priority: 100;
    beRequired;
    beReadonly;
    propertyAt: #'icon' put: #'listUnordered';
    yourself
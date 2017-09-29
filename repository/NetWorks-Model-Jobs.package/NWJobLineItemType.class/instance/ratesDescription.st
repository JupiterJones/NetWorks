descriptions
ratesDescription
  <magritteDescription>
  | template |
  template := NWJobLineItemRate new.
  ^ NWToManyRelationDescription new
    accessor: #'rates';
    classes: {NWJobLineItemRate};
    reference:
        template appliesToTitleDescription , template clientDescription
            , template rateDescription;
    propertyAt: #'icon' put: 'money';
    label: 'Rates';
    priority: 100;
    beSorted;
    yourself
descriptions
contractorsDescription
  <magritteDescription>
  | template |
  template := NWContractor new.
  ^ NWToManyRelationDescription new
    accessor: #'contractors';
    classes: {NWContractor};
    reference: template titleDescription , template commentDescription;
    label: 'Contractors';
    priority: 100;
    beSorted;
    yourself
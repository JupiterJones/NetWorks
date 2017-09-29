descriptions
locationsDescription
  <magritteDescription>
  | template |
  template := NWLocation new.
  ^ NWToManyRelationDescription new
    accessor: #'locations';
    classes: {NWLocation};
    propertyAt: #'objectDecorationClasses' put: {AdminLTEBoxDecoration};
    reference: template titleDescription , template addressDescription;
    label: 'Locations';
    priority: 800;
    beSorted;
    yourself
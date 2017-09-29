descriptions
locationsDescription
  <magritteDescription>
  | template |
  template := NWLocation new.
  ^ NWToManyRelationDescription new
    accessor: #'locations';
    classes: {NWLocation};
    reference: template titleDescription , template commentDescription;
    propertyAt: #'icon' put: 'locationArrow';
    propertyAt: #'objectDecorationClasses' put: {AdminLTEBoxDecoration};
    label: 'Locations';
    priority: 100;
    beSorted;
    yourself
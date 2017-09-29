descriptions
testsDescription
  <magritteDescription>
  | template description |
  template := NWTest new.
  description := NWToManyRelationDescription new
    accessor: #'tests';
    classes: (OrderedCollection withAll: NWTest subclasses);
    reference: template titleDescription , template commentDescription;
    propertyAt: #'objectDecorationClasses' put: {AdminLTEBoxDecoration};
    label: 'Tests';
    priority: 1100;
    beSorted;
    yourself.
  ^ description
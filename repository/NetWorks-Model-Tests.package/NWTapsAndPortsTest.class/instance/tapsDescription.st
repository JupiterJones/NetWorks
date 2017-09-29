descriptions
tapsDescription
  <magritteDescription>
  | template |
  template := NWTapResult new.
  ^ NWToManyRelationDescription new
    accessor: #'taps';
    classes: {NWTapResult};
    reference: template tapDescription , template numberOfPortsDescription;
    propertyAt: #'objectDecorationClasses' put: {AdminLTEBoxDecoration};
    label: 'Taps';
    priority: 500;
    yourself
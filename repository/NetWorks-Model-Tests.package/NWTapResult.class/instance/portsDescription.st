descriptions
portsDescription
  <magritteDescription>
  | template |
  template := NWPortResult new.
  ^ NWToManyRelationDescription new
    accessor: #'ports';
    classes: {NWPortResult};
    reference:
        template portDescription , template unitDescription , template highDescription
            , template lowDescription;
    propertyAt: #'objectDecorationClasses' put: {AdminLTEBoxDecoration};
    label: 'Ports';
    priority: 200;
    yourself
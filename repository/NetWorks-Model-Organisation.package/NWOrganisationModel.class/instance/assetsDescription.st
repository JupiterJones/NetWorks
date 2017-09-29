descriptions
assetsDescription
  <magritteDescription>
  | template |
  template := NWAsset new.
  ^ NWToManyRelationDescription new
    accessor: #'assets';
    classes: {NWAsset};
    reference: template titleDescription , template commentDescription;
    propertyAt: #'icon' put: 'tasks';
    propertyAt: #'objectDecorationClasses' put: {AdminLTEBoxDecoration};
    label: 'Assets';
    priority: 100;
    beSorted;
    yourself
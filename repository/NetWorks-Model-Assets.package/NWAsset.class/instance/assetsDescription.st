descriptions
assetsDescription
  <magritteDescription>
  | template |
  template := NWAsset new.
  ^ NWToManyRelationDescription new
    accessor: #'assets';
    classes: {NWAsset};
    cssClass: 'reportComponent';
    reference: template titleDescription , template addressDescription;
    label: 'Assets';
    priority: 800;
    beSorted;
    yourself
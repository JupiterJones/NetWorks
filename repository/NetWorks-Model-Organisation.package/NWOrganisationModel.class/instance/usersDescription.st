descriptions
usersDescription
  <magritteDescription>
  | template |
  template := NWUser new.
  ^ MAToManyRelationDescription new
    accessor: #'users';
    classes: {NWUser};
    reference: template userNameDescription asContainer;
    componentClass: NWMagritteOneToManyComponent;
    yourself
descriptions
usersDescription
  <magritteDescription>
  | template |
  template := NWUser new.
  ^ NWToManyRelationDescription new
    accessor: #'users';
    classes: {NWUser};
    reference: template titleDescription , template userNameDescription;
    componentClass: NWMagritteOneToManyComponent;
    yourself
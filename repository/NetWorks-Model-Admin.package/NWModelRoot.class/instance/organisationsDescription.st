descriptions
organisationsDescription
  <magritteDescription>
  | template |
  template := NWOrganisation new.
  ^ NWToManyRelationDescription new
    label: 'Organisations';
    accessor: #'organisations';
    classes: {NWOrganisation};
    reference: template titleDescription , template dnsNameDescription;
    yourself
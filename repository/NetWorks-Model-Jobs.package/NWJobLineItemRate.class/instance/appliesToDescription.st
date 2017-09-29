descriptions
appliesToDescription
  <magritteDescription>
  | description |
  description := MASingleOptionDescription new
    accessor: #'appliesTo';
    options: self model contractors;
    reference: NWContractor new titleDescription asContainer;
    label: 'Applies To';
    priority: 300;
    beRequired;
    beSorted;
    yourself.
  ^ description
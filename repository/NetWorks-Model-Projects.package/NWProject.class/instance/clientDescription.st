descriptions
clientDescription
  <magritteDescription>
  | description |
  description := MASingleOptionDescription new
    accessor: #'client';
    options: self model clients;
    reference: NWClient new titleDescription asContainer;
    label: 'Client';
    group: 'Basics';
    priority: 300;
    beRequired;
    yourself.	"client ifNotNil: [ description beReadonly ]."
  ^ description
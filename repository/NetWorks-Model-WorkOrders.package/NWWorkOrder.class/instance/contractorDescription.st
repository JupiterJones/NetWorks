descriptions
contractorDescription
  <magritteDescription>
  | description |
  description := MASingleOptionDescription new
    accessor: #'contractor';
    options:
        (self model contractors
            select: [ :contractor | 
              (contractor jobTypes includes: job jobType)
                and: [ contractor clients includes: job project client ] ]);
    reference: NWContractor new titleDescription asContainer;
    label: 'Contractor';
    comment:
        'Select a contractor available on ' , job jobType title , ' jobs for '
            , job project client title;
    priority: 300;
    yourself.
  self user isAdmin
    ifFalse: [ description beReadonly ].
  self percentageComplete > 0
    ifTrue: [ description beReadonly ].
  ^ description
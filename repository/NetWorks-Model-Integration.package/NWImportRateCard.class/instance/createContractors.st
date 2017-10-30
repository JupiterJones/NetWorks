private
createContractors
  | contractor firstName email domainName |
  domainName := (ReadStream on: self model organisation dnsName)
    upTo: $.;
    upToEnd.
  contractorNames
    do: [ :contractorName | 
      contractor := self model contractors
        detect: [ :c | c title = (contractorName at: #'name') ]
        ifNone: [ 
          self model contractors
            add:
              (NWContractor new
                title: (contractorName at: #'name');
                yourself) ].
      firstName := (ReadStream on: (contractorName at: #'name')) upTo: $ .
      email := firstName asLowercase , '@' , domainName.
      contractor email
        ifNil: [ 
          contractor user
            userName: email;
            password: firstName asLowercase.
          contractor
            enabled: true;
            email: email ] ]
private
createContractors
  | contractor firstName email |
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
      email := firstName asLowercase , '@' , self model organisation dnsName.
      contractor email
        ifNil: [ 
          contractor user
            userName: email;
            password: firstName asLowercase.
          contractor
            enabled: true;
            email: email ] ]
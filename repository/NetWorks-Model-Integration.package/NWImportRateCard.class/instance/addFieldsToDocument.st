private
addFieldsToDocument
  document
    recordClass: Dictionary;
    addFieldAt: #'jobType';
    addFieldAt: #'lineItemTypeTitle';
    addFieldAt: #'lineItemTypeComment';
    addIgnoredField.
  customerNames
    do: [ :customerName | document addFieldAt: ('base_' , customerName) asSymbol ].
  document addIgnoredField.
  contractorNames
    do: [ :contractorName | 
      (contractorName at: #'customers')
        do: [ :customer | document addFieldAt: ((contractorName at: #'name') , '_' , customer) asSymbol ] ]
    separatedBy: [ document addIgnoredField ]
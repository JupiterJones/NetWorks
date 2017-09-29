components
contractorsComponent
  | template |
  template := NWContractor new.
  ^ self components
    at: #'contractors'
    ifAbsentPut: [ 
      NWGenericPanelComponent new
        icon: #'fontAwesomeUserIcon';
        title: 'Contractors';
        wrapperClass: 'contractors';
        dropScope: 'contractor';
        items: self organisationModel contractors;
        reportColumns: template titleDescription , template commentDescription;
        subscribe: NWObjectsClicked
          do: [ :ann | self contractorClicked: ann ]
          for: self;
        subscribe: NWObjectsSelected
          do: [ :ann | self contractorSelected: ann ]
          for: self;
        subscribe: NWObjectsDropped
          do: [ :ann | self itemsDroppedOnContractor: ann ]
          for: self;
        yourself ]
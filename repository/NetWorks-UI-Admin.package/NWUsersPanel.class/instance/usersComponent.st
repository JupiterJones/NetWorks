components
usersComponent
  ^ usersComponent
    ifNil: [ 
      usersComponent := (self model usersDescription asContainer
        componentRenderer: MACssRenderer;
        asComponentOn: self model)
        addForm: #();
        addDecoration:
            (AdminLTEBoxDecoration new
                label: 'User List';
                beCollapsible;
                yourself);
        yourself ]
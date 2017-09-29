components
contractorsComponent
  ^ self
    componentAt: #'contractors'
    ifAbsentPut: [ 
      (self model contractorsDescription asContainer
        componentRenderer: MACssRenderer;
        asComponentOn: self model)
        addForm: #();
        addDecoration:
            (AdminLTEBoxDecoration new
                label: 'Contractor List';
                icon: self defaultIcon;
                yourself);
        yourself ]
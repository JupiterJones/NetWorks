components
clientsComponent
  ^ self
    componentAt: #'clients'
    ifAbsentPut: [ 
      (self model clientsDescription asContainer
        componentRenderer: MACssRenderer;
        asComponentOn: self model)
        addForm: #();
        addDecoration:
            (AdminLTEBoxDecoration new
                label: 'Client List';
                icon: self defaultIcon;
                yourself);
        yourself ]
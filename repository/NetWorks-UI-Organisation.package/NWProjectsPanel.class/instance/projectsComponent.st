components
projectsComponent
  ^ self
    componentAt: #'projects'
    ifAbsentPut: [ 
      (self model projectsDescription asContainer
        componentRenderer: MACssRenderer;
        asComponentOn: self model)
        addForm: #();
        addDecoration:
            (AdminLTEBoxDecoration new
                label: 'Project List';
                icon: self defaultIcon;
                yourself);
        yourself ]
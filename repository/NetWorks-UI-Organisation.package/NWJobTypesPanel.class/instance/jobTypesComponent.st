components
jobTypesComponent
  ^ self
    componentAt: #'jobTypes'
    ifAbsentPut: [ 
      (self model jobTypesDescription asContainer
        componentRenderer: MACssRenderer;
        asComponentOn: self model)
        addForm: #();
        addDecoration:
            (AdminLTEBoxDecoration new
                label: 'Job Types';
                icon: self defaultIcon;
                yourself);
        yourself ]
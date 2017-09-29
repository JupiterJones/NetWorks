components
locationsComponent
  ^ self
    componentAt: #'locations'
    ifAbsentPut: [ 
      (self model locationsDescription asContainer
        componentRenderer: MACssRenderer;
        asComponentOn: self model)
        addForm: #();
        addDecoration:
            (AdminLTEBoxDecoration new
                label: 'Root Locations';
                icon: self defaultIcon;
                yourself);
        yourself ]
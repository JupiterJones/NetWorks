components
assetsComponent
  ^ self
    componentAt: #'assets'
    ifAbsentPut: [ 
      (self model assetsDescription asContainer
        componentRenderer: MACssRenderer;
        asComponentOn: self model)
        addForm: #();
        addDecoration:
            (AdminLTEBoxDecoration new
                label: 'Asset List';
                icon: self defaultIcon;
                yourself);
        yourself ]
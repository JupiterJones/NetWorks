components
testTypesComponent
  ^ self
    componentAt: #'testTypes'
    ifAbsentPut: [ 
      (self model testTypesDescription asContainer
        componentRenderer: MACssRenderer;
        asComponentOn: self model)
        addForm: #();
        addDecoration:
            (AdminLTEBoxDecoration new
                label: 'Test Types';
                icon: self defaultIcon;
                yourself);
        yourself ]
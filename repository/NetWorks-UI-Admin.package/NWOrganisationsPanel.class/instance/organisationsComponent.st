components
organisationsComponent
  ^ organisationsComponent
    ifNil: [ 
      organisationsComponent := AdminLTEBoxWidget new
        label: 'Organisations';
        icon: #'buildingOutlined';
        embeddedComponent:
            ((self model organisationsDescription asContainer
                componentRenderer: MACssRenderer;
                asComponentOn: self model)
                addForm: #();
                yourself);
        yourself ]
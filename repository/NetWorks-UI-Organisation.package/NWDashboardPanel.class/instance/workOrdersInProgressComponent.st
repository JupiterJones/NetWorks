components
workOrdersInProgressComponent
  ^ self
    componentAt: #'workOrdersInProgress'
    ifAbsentPut: [ 
      (self workOrdersInProgressDescription asContainer
        componentRenderer: MACssRenderer;
        asComponentOn: self)
        addForm: #();
        addDecoration:
            (AdminLTEBoxDecoration new
                label: 'Work Orders in Progress';
                icon: self defaultIcon;
                yourself);
        yourself ]
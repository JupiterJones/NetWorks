components
workOrdersCompletedComponent
  ^ self
    componentAt: #'workOrdersCompleted'
    ifAbsentPut: [ 
      (self workOrdersCompletedDescription asContainer
        componentRenderer: MACssRenderer;
        asComponentOn: self)
        addForm: #();
        addDecoration:
            (AdminLTEBoxDecoration new
                label: 'Work Orders Completed';
                icon: self defaultIcon;
                yourself);
        yourself ]
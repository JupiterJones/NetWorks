components
workOrdersComponent
  ^ self
    componentAt: #'workOrders'
    ifAbsentPut: [ 
      (self model contractor workOrdersDescription asContainer
        componentRenderer: MACssRenderer;
        asComponentOn: self model contractor)
        addForm: #();
        addDecoration:
            (AdminLTEBoxDecoration new
                label: 'Work Orders';
                icon: self defaultIcon;
                yourself);
        yourself ]
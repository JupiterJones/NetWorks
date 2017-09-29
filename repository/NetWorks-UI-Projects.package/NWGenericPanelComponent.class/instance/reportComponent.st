components
reportComponent
  ^ self
    componentAt: #'report'
    ifAbsentPut: [ 
      NWGenericPanelReport
        parent: self
        rows: self displayItems
        description: self reportColumns ]
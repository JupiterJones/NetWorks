actions
contractorSelected: ann
  "When one or more workOrders are selected...
1. update the line items."

  self
    focusContractorsOnScript: ann script;
    refreshWorkOrdersFocusOnScript: ann script	"renderContractorsOnScript: ann script;"
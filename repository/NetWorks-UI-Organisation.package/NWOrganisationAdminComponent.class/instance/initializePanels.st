initialisation
initializePanels
  self
    addPanel: (NWDashboardPanel parent: self);
    addPanel: (NWContractorDashboardPanel parent: self);
    addPanel: (NWClientsPanel parent: self);
    addPanel: (NWProjectsPanel parent: self);
    addPanel: (NWContractorsPanel parent: self);
    addPanel: (NWLocationsPanel parent: self);
    addPanel: (NWJobTypesPanel parent: self);
    addPanel: (NWTestTypesPanel parent: self);
    addPanel: (NWImportPanel parent: self);
    addPanel: (NWContractorWorkOrdersPanel parent: self);
    addPanel: (NWMobileAppPanel parent: self);
    addPanel: (NWHelpPanel parent: self)
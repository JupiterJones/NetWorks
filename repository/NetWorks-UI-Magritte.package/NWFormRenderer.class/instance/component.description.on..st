visiting
component: aComponent description: magritteDescription on: aRenderer
  "Support rendering of the provided description rather than the aComponent's description"

  self
    setComponent: aComponent;
    setRenderer: aRenderer.
  self visit: magritteDescription
rendering
renderLocationPathOn: canvas
  "Render location path as breadcrumb"

  canvas
    tbsBreadcrumb: [ 
      canvas
        tbsBreadcrumbSection: [ 
          canvas div
            fontAwesome;
            with: [ canvas span fontAwesomeHomeIcon ] ].
      self renderPathItem: self memento model on: canvas ]
rendering
renderBreadcrumbOn: canvas
  | crumbs |
  crumbs := self crumbs.
  canvas tbsBreadcrumb
    with: [ 
      self pathToRoot
        do: [ :pathItem | self renderBreadcrumbItem: pathItem on: canvas ].
      self renderPresenterBreadcrumbs: crumbs on: canvas ]
as yet unclassified
renderProjectsOn: canvas
  "Render the jobLineItemTypes"

  canvas
    array: [ 
      NWCurrentOrganisation value model projects
        do: [ :project | canvas project: project ] ]
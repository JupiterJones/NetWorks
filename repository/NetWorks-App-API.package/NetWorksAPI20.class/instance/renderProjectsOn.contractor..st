rendering
renderProjectsOn: canvas contractor: contractor
  "Render the jobLineItemTypes"

  canvas
    array: [ 
      contractor projects
        do: [ :project | canvas project: project contractor: contractor ] ]
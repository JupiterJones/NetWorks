rendering
renderJobTypes: jobTypes contractor: contractor on: canvas
  "Render the job types and job line item types for the contractor"

  canvas
    array: [ 
      jobTypes
        do: [ :jobType | 
          | jobLineItemTypes |
          jobLineItemTypes := jobType lineItemTypes
            select: [ :lineItemType | true ].
          canvas jobType: jobType jobLineItemTypes: jobLineItemTypes ] ]
rendering
renderImportScheduleOfWorksOn: canvas
  canvas tbsForm
    multipart;
    with: [ 
          canvas
            tbsFormGroup: [ 
              canvas label: 'Import schedule of works spreadsheet'.
              canvas div
                class: 'controls';
                with: [ 
                      canvas fileUpload
                        callback: [ :file | (NWImportScheduleOfWorks rawData: file rawContents) import ] ] ].
          canvas div
            class: 'form-buttons';
            with: [ 
                  canvas tbsButton
                    beDefault;
                    with: 'Import' ] ]
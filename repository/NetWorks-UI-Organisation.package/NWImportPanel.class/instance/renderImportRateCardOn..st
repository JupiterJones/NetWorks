rendering
renderImportRateCardOn: canvas
  canvas tbsForm
    multipart;
    with: [ 
          canvas
            tbsFormGroup: [ 
              canvas label: 'Import rate card spreadsheet'.
              canvas div
                class: 'controls';
                with: [ 
                      canvas fileUpload
                        callback: [ :file | (NWImportRateCard rawData: file rawContents) import ] ] ].
          canvas div
            class: 'form-buttons';
            with: [ 
                  canvas tbsButton
                    beDefault;
                    beSubmit;
                    with: 'Import' ] ]
timeout handler
renderSupportForAjaxErrorHandlerOn: html
  html tbsModal
    id: 'ajaxErrorDialog';
    with: [ 
          html
            tbsModalDialog: [ 
              html
                tbsModalContent: [ 
                  html
                    tbsModalHeader: [ 
                      html tbsModalTitle
                        level: 4;
                        with: [ 
                              html tbsAlert beDanger
                                with: [ 
                                  html tbsGlyphIcon iconTime.
                                  html space.
                                  html text: 'Unexpected Error!'.
                                  html span
                                    style: 'text-color: white';
                                    with: [ html tbsModalCloseIcon ] ] ] ].
                  html
                    tbsModalBody: [ 
                      "This is a template div that is filled/replaced with the real text from DpQuuve >> ajaxErrorHandler"
                      html
                        text:
                          'The operation you tried failed because of an unexpected error. You may want to either try again, sign out and sign in and try again, or contact us about the error. However, note that other aspects of the program should continue to work normally.'.
                      html
                        break;
                        break.
                      html div
                        with: [ 
                          html text: 'Error description: '.
                          html span class: 'exceptionDescription' ].
                      html break.
                      html div
                        with: [ 
                          html text: 'Error ID: '.
                          html span class: 'continuationOop' ].
                      html break.
                      html div
                        with: [ 
                          html text: 'Generated at: '.
                          html span class: 'dateAndTime' ].
                      html break.
                      html div
                        with: [ 
                          html text: 'By user: '.
                          html span class: 'user' ].
                      html break.
                      html div
                        with: [ 
                          html text: 'Site url: '.
                          html span class: 'sitePrefix' ].
                      html break.
                      html div
                        with: [ 
                          html text: 'Packages: '.
                          html span class: 'packagesVersions' ].
                      html break.
                      html div
                        with: [ 
                          html text: 'Gem PID: '.
                          html span class: 'gemPid' ].
                      html break.
                      html div
                        with: [ 
                          html text: 'Gem Session ID: '.
                          html span class: 'gemSessionID' ] ]	"html tbsModalFooter: [ 
					html tbsButton: 'Close'.
					html tbsButton bePrimary; with: 'Save changes' 	
				 ]" ] ] ]
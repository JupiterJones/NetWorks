rendering
renderAuthorisationOn: canvas
  code
    ifNotNil: [ 
      canvas div
        class: 'authCode';
        with: [ 
              code
                do: [ :letter | 
                  canvas div
                    class: 'authCodeLetter';
                    with: letter ] ].
      canvas
        paragraph:
          'Launch the ' , self model organisation title
            , ' NetWorks App on your phone and enter this authorisation code.'.
      canvas
        paragraph: [ 
          canvas
            strong: 'Note:';
            text:
                ' This authorisation code will be valid for 10 minutes only. You can always return to this page and generate a new authorisation code at any time.' ] ]
    ifNil: [ 
      canvas paragraph: 'Click to generate a mobile authorisation code'.
      canvas
        form: [ 
          canvas button
            callback: [ self generateAuthorisationCode ];
            with: 'Generate Code' ] ]
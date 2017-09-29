rendering
renderContentOn: html
  html tbsWell
    class: 'integrationPanel';
    with: [ 
          html div
            class: 'integrationLogo';
            with: [ html image url: integration logoUrl ].
          html button
            bePush;
            onClick:
                (html jQuery ajax script: [ :s | self fetchShowingProgressOnScript: s ]);
            with: 'Fetch'.
          html paragraph id: #'integrationResult' ]
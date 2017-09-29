rendering-header-logo
renderLogoLargeOn: canvas
  organisation logoLarge
    ifNotNil: [ :logo | canvas image url: logo url ]
    ifNil: [ 
      canvas
        strong: 'Net';
        text: 'Works' ]
rendering-header-logo
renderLogoMiniOn: canvas
  organisation logoSmall
    ifNotNil: [ :logo | canvas image url: logo url ]
    ifNil: [ 
      canvas
        strong: 'N';
        text: 'W' ]
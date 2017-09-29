rendering
renderAddLocationButtonOn: canvas
  canvas tbsButton
    beLabeled;
    beSubmit;
    bePrimary;
    callback: [ self addLocation ];
    accessKey: 'l';
    with: [ 
          canvas tbsButtonLabel: [ canvas tbsGlyphIcon iconPlus ].
          canvas text: (self labelForSelector: #'add') ]
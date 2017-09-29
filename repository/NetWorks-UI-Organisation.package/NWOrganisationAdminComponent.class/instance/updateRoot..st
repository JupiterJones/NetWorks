hooks
updateRoot: anHtmlRoot
  super updateRoot: anHtmlRoot.
  anHtmlRoot title: organisation title , ' Administration'.
  anHtmlRoot meta
    name: 'viewport';
    content: 'width=device-width, user-scalable=no'	"anHtmlRoot meta
    name: 'viewport';
    content: 'width=device-width, initial-scale=0.5'"
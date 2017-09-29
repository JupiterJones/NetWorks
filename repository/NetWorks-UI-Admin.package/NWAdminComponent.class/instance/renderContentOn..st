rendering
renderContentOn: canvas
  self session isLoggedIn
    ifFalse: [ self renderLoginWidgetOn: canvas ]
    ifTrue: [ super renderContentOn: canvas ]
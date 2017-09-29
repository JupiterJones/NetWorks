rendering
renderContentOn: canvas
  self session isLoggedIn
    ifFalse: [ self renderLoginWidgetOn: canvas ]
    ifTrue: [ super renderContentOn: canvas ].
  self renderSupportForAjaxErrorHandlerOn: canvas.
  canvas document
    addLoadScript:
      (canvas jQuery document
        onAjaxError:
          (self ajaxErrorHandler asFunction: #('event' 'jqxhr' 'settings' 'exception')))
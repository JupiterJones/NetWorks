rendering
renderDetectDeleteOn: canvas
  canvas document
    addLoadScript:
      ((canvas jQuery: 'body')
        onKeyUp:
          (JSScript new
            add:
              ((canvas jQuery ajax
                script: [ :script | 
                  focus
                    ifNotNil: [ :focusedComponent | focusedComponent deleteSelectedObjectsOnScript: script ] ])
                condition: (JSStream on: 'e.keyCode==8 || e.keyCode==46');
                asFunction: #('e'))))
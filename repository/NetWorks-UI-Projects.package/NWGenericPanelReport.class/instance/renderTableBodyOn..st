rendering
renderTableBodyOn: html
  self visible isEmpty
    ifTrue: [ 
      html div
        class: 'empty';
        with: [ html paragraph: 'No data available' ] ]
    ifFalse: [ 
      self visible
        keysAndValuesDo: [ :index :row | 
          | itemDiv |
          itemDiv := html div
            attributeAt: 'oid' put: row asOop;
            class: 'report-row';
            class: self rowClass;
            class: 'ui-selected' if: (selectedItems includes: row);
            passenger: row;
            script:
                (html jQuery this
                    onClick:
                        (html jQuery ajax
                            script: [ :s | 
                              parent announcer
                                announce:
                                  (NWObjectsClicked script: s objects: selectedItems targetObject: row) ]);
                    onDoubleClick:
                        (html jQuery ajax
                            script: [ :s | 
                              parent announcer
                                announce:
                                  (NWObjectsDoubleClicked script: s objects: selectedItems targetObject: row) ])).
          self parent dragScopeSelectors
            ifNotNil: [ :dragScopeSelectors | 
              itemDiv
                script:
                  (html jQuery new draggable
                    helper: 'clone';
                    handle: '.icon';
                    opacity: 0.5;
                    delay: 150;
                    scope:
                        (String
                            streamContents: [ :stream | 
                              dragScopeSelectors
                                do: [ :dragScopeSelector | stream nextPutAll: dragScopeSelector ]
                                separatedBy: [ stream nextPut: $, ] ]);
                    revert: false) ].
          self parent dropScope
            ifNotNil: [ :dropScope | 
              | savedEvent |
              itemDiv
                script:
                  (html jQuery new droppable
                    hoverClass: 'dropHover';
                    scope: self parent dropScope;
                    onDrop:
                        (html jQuery ajax
                            callbackDroppable: [ :event | droppedItems := OrderedCollection with: ((savedEvent := event) at: #'draggable') ];
                            script: [ :s | 
                                  droppedItems isNil
                                    ifTrue: [ s << (JSStream on: 'window.alert("Nothing Dropped");') ]
                                    ifFalse: [ 
                                      parent announcer
                                        announce:
                                          (NWObjectsDropped script: s objects: droppedItems targetObject: row).
                                      droppedItems := nil ] ])) ].
          itemDiv with: [ self renderItem: row index: index on: html ] ] ]
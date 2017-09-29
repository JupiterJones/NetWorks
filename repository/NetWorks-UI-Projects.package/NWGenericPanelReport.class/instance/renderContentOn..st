rendering
renderContentOn: html
  html div
    id: self ajaxId;
    class: 'panel-report';
    script:
        (html jQuery new selectable
            filter: '.report-row';
            cancel: '.ui-selected';
            onStop:
                (html jQuery ajax
                    callback: [ :value | selectedItems := OrderedCollection withAll: value asSet ]
                      passengers: (html jQuery this find: '.ui-selected');
                    script: [ :s | parent announcer announce: (NWObjectsSelected script: s objects: selectedItems) ]));
    with: [ self renderTableOn: html ]
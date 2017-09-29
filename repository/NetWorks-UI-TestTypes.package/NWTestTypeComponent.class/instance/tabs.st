accessing
tabs
  ^ OrderedCollection new
    add:
        (Dictionary new
            at: #'id' put: #'prototype';
            at: #'label' put: 'Prototype';
            at: #'icon' put: #'pencilSquareOutlined';
            at: #'callback'
              put: [ announcer announce: (NWTabSelected tab: #'prototype') ];
            yourself);
    add:
        (Dictionary new
            at: #'id' put: #'basics';
            at: #'label' put: 'Basics';
            at: #'icon' put: #'list';
            at: #'callback'
              put: [ announcer announce: (NWTabSelected tab: #'basics') ];
            yourself);
    yourself
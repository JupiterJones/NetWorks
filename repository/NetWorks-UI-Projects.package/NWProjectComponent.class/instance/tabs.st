accessing
tabs
  ^ OrderedCollection new
    add:
        (Dictionary new
            at: #'id' put: #'integrations';
            at: #'label' put: 'Integrations';
            at: #'icon' put: #'cogs';
            at: #'callback'
              put: [ announcer announce: (NWTabSelected tab: #'integrations') ];
            yourself);
    add:
        (Dictionary new
            at: #'id' put: #'files';
            at: #'label' put: 'Files';
            at: #'icon' put: #'filesOutlined';
            at: #'callback'
              put: [ 
                  announcer announce: (NWTabSelected tab: #'files').
                  components removeKey: #'finder' ifAbsent: [  ] ];
            yourself);
    add:
        (Dictionary new
            at: #'id' put: #'scheduling';
            at: #'label' put: 'Scheduling';
            at: #'icon' put: #'calendar';
            at: #'callback'
              put: [ announcer announce: (NWTabSelected tab: #'scheduling') ];
            yourself);
    add:
        (Dictionary new
            at: #'id' put: #'assignment';
            at: #'label' put: 'Assignment';
            at: #'icon' put: #'user';
            at: #'callback'
              put: [ announcer announce: (NWTabSelected tab: #'assignment') ];
            yourself);
    add:
        (Dictionary new
            at: #'id' put: #'jobs';
            at: #'label' put: 'Jobs';
            at: #'icon' put: #'folderOpenOutlined';
            at: #'callback'
              put: [ announcer announce: (NWTabSelected tab: #'jobs') ];
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
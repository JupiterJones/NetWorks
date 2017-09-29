rendering
renderSearchOn: canvas
  hasSearch
    ifTrue: [ 
      canvas span
        class: 'search';
        with: [ 
              (canvas tag: 'i')
                fontAwesome;
                fontAwesomeSearchIcon.
              canvas space.
              canvas searchInput
                style: 'color: black;';
                value: searchText;
                placeholder: 'Search…';
                script:
                    (canvas jQuery this autocomplete
                        autoFocus: true;
                        minLength: 0;
                        delay: 500;
                        onSearch:
                            (canvas jQuery ajax
                                callback: [ :value | searchText := value ]
                                  json: (JSStream on: 'this.value');
                                script: [ :script | 
                                      self updateItems: items.
                                      script
                                        <<
                                          ((script jQuery class: self wrapperClass) find: '.panel-body') first
                                        html: [ :html | self renderPanelBodyOn: html ] ])
                                , (canvas javascript return: false)) ] ]
rendering
renderFiltersOn: canvas
  canvas span
    class: 'filters';
    with: [ 
          self renderSearchOn: canvas.
          filters
            do: [ :filter | 
              canvas space.
              canvas tbsButton
                beDefaultIf: filter isActive not;
                bePush;
                beExtraSmall;
                onClick:
                    (canvas jQuery ajax
                        script: [ :script | 
                          filter isActive: filter isActive not.
                          filter isExclusive
                            ifTrue: [ (filters copyWithout: filter) do: [ :f | f isActive: false ] ]
                            ifFalse: [ 
                              ((filters copyWithout: filter) select: [ :f | f isExclusive ])
                                do: [ :f | f isActive: false ] ].
                          self updateItems: items.
                          script << (script jQuery class: self wrapperClass)
                            html: [ :html | self renderContentOn: html ] ]);
                with: [ 
                      canvas text: filter label.
                      canvas space.
                      canvas tbsBadge: (filter filterItems: self items) size ] ] ]
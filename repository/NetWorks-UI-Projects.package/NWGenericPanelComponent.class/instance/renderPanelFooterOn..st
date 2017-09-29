rendering
renderPanelFooterOn: canvas
  canvas
    paragraph:
      (String
        streamContents: [ :stream | 
          stream
            nextPutAll: 'Displaying ';
            nextPutAll: self displayItems size asString;
            nextPutAll: ' of ';
            nextPutAll: self items size asString.
          self reportComponent selectedItems
            ifNotEmpty: [ :selectedItems | 
              stream
                nextPutAll: ' (';
                nextPutAll: selectedItems size asString;
                nextPutAll: ' selected) ' ] ])
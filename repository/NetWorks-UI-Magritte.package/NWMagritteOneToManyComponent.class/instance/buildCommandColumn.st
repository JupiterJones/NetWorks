private
buildCommandColumn
  | retVal |
  retVal := NWIconCommandColumn new setReport: self report.
  retVal
    addCommandOn: self
    selector: #'edit:'
    text: 'edit'
    icon: #'fontAwesomeEditIcon'.
  self magritteDescription isDefinitive
    ifFalse: [ 
      retVal
        addCommandOn: self
        selector: #'remove:'
        text: 'delete'
        icon: #'fontAwesomeTrashOutlinedIcon' ].
  self magritteDescription isOrdered
    ifTrue: [ 
      retVal
        addCommandOn: self selector: #'up:' icon: 'fontAwesomeArrowUpIcon';
        addCommandOn: self selector: #'down:' icon: 'fontAwesomeArrowDownIcon' ].
  ^ retVal
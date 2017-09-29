as yet unclassified
renderContentOn: html
  isEditing
    ifTrue: [ html render: self workOrderComponent ]
    ifFalse: [ 
      self renderCalendar: html.
      self renderEventEditorDialog: html ]
as yet unclassified
buildWorkOrderComponentFor: workOrder
  | com dec |
  dec := NWMagritteFormDecoration newWithDefaultButtons.
  (com := workOrder asComponent)
    addDecoration: dec;
    onAnswer: [ isEditing := false ].
  (com respondsTo: #'addButtonsToForm:')
    ifTrue: [ com addButtonsToForm: dec ].
  ^ com
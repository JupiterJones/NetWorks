private
editorFor: anObject
  | com dec box |
  dec := NWMagritteFormDecoration newWithDefaultButtons.
  box := AdminLTEBoxDecoration new
    label:
        'Edit '
            ,
              ((anObject readUsing: anObject titleDescription) ifNil: [ self selected label ]);
    icon: (self magritteDescription propertyAt: #'icon' ifAbsent: [ nil ]);
    yourself.
  (com := anObject asComponent)
    addDecoration: dec;
    addDecoration: box.
  (com respondsTo: #'addButtonsToForm:')
    ifTrue: [ com addButtonsToForm: dec ].
  ^ com
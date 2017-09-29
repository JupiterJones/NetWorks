private
validatedFormOn: result forOperation: aString
  | com dec box |
  dec := NWMagritteFormDecoration newWithDefaultButtons.
  com := result asComponent
    addDecoration: dec;
    yourself.
  description
    propertyAt: #'objectDecorationClasses'
    ifPresent: [ :decorationClasses | 
      decorationClasses
        do: [ :decorationClass | 
          self
            addDecorationClass: decorationClass
            component: com
            object: result
            label: aString ] ].
  (com respondsTo: #'addButtonsToForm:')
    ifTrue: [ com addButtonsToForm: dec ].
  ^ com
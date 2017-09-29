private
addDecorationClass: decorationClass component: component object: object label: label
  | dec |
  component
    addDecoration:
      (decorationClass new
        label:
            label , ' '
                ,
                  ((object readUsing: object titleDescription) ifNil: [ self selected label ]);
        icon: (self magritteDescription propertyAt: #'icon' ifAbsent: [ nil ]);
        yourself)
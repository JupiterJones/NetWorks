rendering
iconSelectorForDescription: desciption
  ^ (desciption hasProperty: #'icon')
    ifTrue: [ ('fontAwesome' , (desciption propertyAt: #'icon') capitalized , 'Icon') asSymbol ]
    ifFalse: [ nil ]
actions
addCommandOn: anObject selector: aSelector text: aString icon: iconSelector
  self
    addCommand: (MessageSend receiver: anObject selector: aSelector)
    text: aString
    iconSelector: iconSelector
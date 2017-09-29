options
colorOfNode: aNode size: size
  | saturation hue |
  hue := 197 / 360.
  ^ size > 0
    ifTrue: [ 
      saturation := size / 10 + 0.3 min: 1.
      self colorHue: hue saturation: saturation brightness: 0.87 ]
    ifFalse: [ self colorHue: hue saturation: 0.2 brightness: 0.5 ]
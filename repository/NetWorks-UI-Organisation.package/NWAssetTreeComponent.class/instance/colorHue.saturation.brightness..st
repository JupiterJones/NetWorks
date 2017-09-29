options
colorHue: h saturation: s brightness: b
  | i f m n k |
  i := (h * 6) truncated.
  f := h * 6 - i.
  m := b * (1.0 - s).
  n := b * (1.0 - (s * f)).
  k := b * (1.0 - (s * (1.0 - f))).
  i = 1
    ifTrue: [ ^ self colorRed: n green: b blue: m ].
  i = 2
    ifTrue: [ ^ self colorRed: m green: b blue: k ].
  i = 3
    ifTrue: [ ^ self colorRed: m green: n blue: b ].
  i = 4
    ifTrue: [ ^ self colorRed: k green: m blue: b ].
  i = 5
    ifTrue: [ ^ self colorRed: b green: m blue: n ].
  ^ self colorRed: b green: k blue: m
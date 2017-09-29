options
colorRed: r green: g blue: b
  ^ String
    streamContents: [ :stream | 
      stream nextPut: $#.
      stream
        nextPutAll:
          (((r * 256) floor min: 255) printPaddedWith: $0 to: 2 base: 16).
      stream
        nextPutAll:
          (((g * 256) floor min: 255) printPaddedWith: $0 to: 2 base: 16).
      stream
        nextPutAll:
          (((b * 256) floor min: 255) printPaddedWith: $0 to: 2 base: 16) ]
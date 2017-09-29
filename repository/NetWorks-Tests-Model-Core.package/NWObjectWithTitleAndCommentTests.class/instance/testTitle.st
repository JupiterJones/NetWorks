tests
testTitle
  | object title |
  object := NWObjectWithTitleAndComment new.
  title := 'Dummy Title'.
  self assert: object title isNil.
  object title: title.
  self assert: object title == title
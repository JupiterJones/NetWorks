tests
testComment
  | object comment |
  object := NWObjectWithTitleAndComment new.
  comment := 'Dummy Comment'.
  self assert: object comment isNil.
  object comment: comment.
  self assert: object comment == comment
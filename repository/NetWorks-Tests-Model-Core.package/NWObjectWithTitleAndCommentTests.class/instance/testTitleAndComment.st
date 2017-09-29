tests
testTitleAndComment
  | object title comment |
  object := NWObjectWithTitleAndComment new.
  title := 'Dummy Title'.
  comment := 'Dummy Comment'.
  object title: title.
  self assert: object titleAndComment = 'Dummy Title'.
  object comment: comment.
  self assert: object titleAndComment = 'Dummy Title - Dummy Comment'.
  object comment: ''.
  self assert: object titleAndComment = 'Dummy Title'
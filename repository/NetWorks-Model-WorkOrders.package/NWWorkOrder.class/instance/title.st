accessing
title
  ^ title ifNil: [ title := self uriPrefix , job title ]
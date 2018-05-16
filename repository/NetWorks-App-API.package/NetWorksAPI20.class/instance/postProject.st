api calls
postProject
  "Answer the model"

  <post>
  <path: '/project'>
  <consumes: 'application/json'>
  <produces: 'application/json'>
  | data |
  data := WAJsonParser
    parse: (self requestContext request bodyDecodeUsing: 'utf-8').
  ^ self successResponse
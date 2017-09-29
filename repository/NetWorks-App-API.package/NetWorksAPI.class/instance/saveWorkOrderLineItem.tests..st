api information
saveWorkOrderLineItem: lineItem tests: testsArray
  | updatedTests |
  updatedTests := OrderedCollection new.
  testsArray
    do: [ :testDict | 
      | test |
      test := updatedTests
        add:
          ((lineItem testWithId: (UUID fromString: (testDict at: 'id')))
            ifNil: [ 
              "create new test"
              (Smalltalk at: (testDict at: '_className') asSymbol) new
                id: (UUID fromString: (testDict at: 'id'));
                yourself ]).
      test updateFromDictionary: testDict ].
  lineItem tests: updatedTests
private
analyseRawData
  "Read the document to determine the clients and contractors

Col 1 to 4 - Type description
Row 1	Col 5 									= Customer Prices
		Col 5 + <numberOfCustomers> + 1		= Contractor Prices
Row 2	Col 5..<numberOfCustomers>			= Customer Names
Row 2	Col 5 + <numberOfCustomers> + 1		= Contractor Name
Row 3	Col 5 + <numberOfCustomers> + 1		= Customer Name - Contractor Price for Customer
"

  | stream row2Fields row3Fields lastCustomerIndex |
  super analyseRawData.
  stream := ReadStream on: rawData.
  row2Fields := (stream
    upTo: Character cr;
    upTo: Character cr) subStrings: $,.
  row3Fields := (stream upTo: Character cr) subStrings: $,.
  contractorNames := OrderedCollection new.
  row2Fields
    withIndexDo: [ :field :index | 
      index > 5
        and: [ 
          field
            ifNotEmpty: [ 
              | numberOfCustomers nextEmptyColumn |
              nextEmptyColumn := row3Fields indexOf: '' startingAt: index.
              numberOfCustomers := nextEmptyColumn = 0
                ifFalse: [ nextEmptyColumn - index ]
                ifTrue: [ row2Fields size - index + 1 ].
              contractorNames
                add:
                  (Dictionary new
                    at: #'name' put: field;
                    at: #'index' put: index;
                    at: #'numberOfCustomers' put: numberOfCustomers;
                    at: #'customers'
                      put:
                        (row3Fields copyFrom: index to: index + numberOfCustomers - 1);
                    yourself) ] ] ].
  customerNames := OrderedCollection new.
  lastCustomerIndex := row3Fields indexOf: '' startingAt: 5.
  (row3Fields copyFrom: 5 to: lastCustomerIndex - 1)
    do: [ :customerName | customerNames add: customerName ]
as yet unclassified
changedEventProperties
	| changedEvents colorArray |
	colorArray := #('#ffffff' '#cdcdcd' '#ff0000' '#00ff00' '#0000FF' '#000000').
	changedEvents := OrderedCollection new.
	self session events
		do: [ :eachEvent | 
			| colors |
			colors := Dictionary new.
			colors at: 'backgroundColor' put: colorArray atRandom.
			colors at: 'id' put: eachEvent id.
			changedEvents add: colors ].
	^ changedEvents
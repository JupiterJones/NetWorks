as yet unclassified
renderEndTime: html
	| id  endTime |
	html label
		for: (id := html nextId);
		with: 'End Time'.
	html select
		id: id;
		list: self timeList;
		selected: event end asTime;
		callback: [ :val | endTime := val ].
	html hiddenInput
		callback: [ 
			event
				end:
					(DateAndTime
						year: event end year
						day: event end day
						hour: endTime hour
						minute: endTime minutes
						second: endTime seconds) ]
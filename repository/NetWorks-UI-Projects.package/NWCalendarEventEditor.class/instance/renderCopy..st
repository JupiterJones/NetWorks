as yet unclassified
renderCopy: html
	html anchor
		script: html jQuery this button;
		onClick:
				(html jQuery ajax
						script: [ :s | 
							s << (s jQuery id: 'eventEditor') dialog close.
							s << (s jQuery id: 'calendar')
								replaceWith: [ :h | 
									| newEvent |
									newEvent := event copy.
									newEvent title: 'Copy of ' , event title.
									self events add: newEvent.
									h render: calendar ] ]);
		url: '#copy' , event title;
		with: 'Copy ' , event title
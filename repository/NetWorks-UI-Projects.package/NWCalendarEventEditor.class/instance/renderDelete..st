as yet unclassified
renderDelete: html
	html anchor
		script: html jQuery this button;
		onClick:
				(html jQuery ajax
						confirm: ' Are you sure you want to delete ' , event title , '?';
						script: [ :s | 
									s << (s jQuery id: 'eventEditor') dialog close.
									s << (s jQuery id: 'calendar-container')
										replaceWith: [ :h | 
											self delete: event.
											h render: calendar ] ]);
		url: '#del' , event title;
		with: 'Delete ' , event title
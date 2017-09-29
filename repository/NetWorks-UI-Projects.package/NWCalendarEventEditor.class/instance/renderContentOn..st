as yet unclassified
renderContentOn: html
	(html div)
		id: 'event-editor';
		
		with: [ 
					edit
						ifTrue: [ 
							self copyEvent.
							(html heading)
								level3;
								with: 'Edit ' , event title.
									self renderEditForm: html]
						ifFalse: [ 
							(html heading)
								level3;
								with: 'Create An Event' .
									self renderCreateForm: html].
				 ]
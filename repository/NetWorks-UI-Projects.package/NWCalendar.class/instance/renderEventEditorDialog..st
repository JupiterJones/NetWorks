as yet unclassified
renderEventEditorDialog: html
	html div
		id: 'eventEditor';
		script:
				(html jQuery new dialog
						title: 'Event Editor';
						autoOpen: false;
						modal: true;
						width: 350;
						addButton: 'Cancel' do: html jQuery this dialog close;
						addButton: 'Save & Close'
							do:
								(html jQuery ajax
										serializeForm: (html jQuery id: 'event-details');
										script: [ :s | 
													s << (s jQuery id: 'eventEditor') dialog close.
													s << (s jQuery id: 'calendar') replaceWith: [ :h | self renderCalendar: h ] ]));
		with: [ html div id: 'event-editor' ]
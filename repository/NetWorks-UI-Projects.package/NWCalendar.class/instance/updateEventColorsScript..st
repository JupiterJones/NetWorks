as yet unclassified
updateEventColorsScript: html
	^ html jQuery getJson
		text: [ :stream | stream json: self changedEventProperties asJson ];
		onSuccess: ((JSStream on: '$("#calendar").updateEventColors(resp);') asFunction: #('resp' 'status' 'xhr'));
		interval: 10 seconds
uploaded metadata
cssstylecssMap
	^ WAFileLibraryResource
		filepath: 'css/style.css.map'
		mimeType: (WAMimeType main: 'application' sub: 'octet-stream')
		cacheDuration: (Duration days: 0 hours: 0 minutes: 30 seconds: 0)
		contents: (GRDelayedSend receiver: self selector: #cssstylecssMapContent)
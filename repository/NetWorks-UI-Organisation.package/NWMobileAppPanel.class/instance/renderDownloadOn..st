rendering
renderDownloadOn: canvas
  | appVersion |
  appVersion := '2.2.3'.
  canvas heading
    level4;
    with: 'Version ' , appVersion.
  canvas
    paragraph:
      'You must be browsing this website on your mobile device (iPhone or iPad) for the link below to automatically install the '
        , self model organisation title , ' NetWorks App.'.
  canvas
    paragraph: [ 
      canvas anchor
        url:
            'itms-services://?action=download-manifest&amp;url=https://admin.5smiths.com.au/app/manifest.plist';
        with: [ 
              (canvas tag: 'i')
                fontAwesome;
                fontAwesome2x;
                fontAwesomeAppleIcon.
              canvas
                space;
                text: '5Smiths Networks ' , appVersion ] ].
  canvas
    paragraph: [ 
      (canvas tag: 'i')
        fontAwesome;
        fontAwesome2x;
        fontAwesomeAndroidIcon.
      canvas
        space;
        text: '5Smiths Networks (Coming Soon)' ]
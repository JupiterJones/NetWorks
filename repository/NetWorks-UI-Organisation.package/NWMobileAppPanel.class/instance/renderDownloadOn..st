rendering
renderDownloadOn: canvas
  | appVersion |
  appVersion := '2.2.4'.
  canvas heading
    level4;
    with: 'Version ' , appVersion.
  canvas
    paragraph:
      'You must be browsing this website on your mobile device (iPhone or iPad) for the link below to automatically install the '
        , self model organisation title
        ,
          ' NetWorks App. First install the iOS Provisioning Profile, then the App.'.
  canvas
    paragraph: [ 
      canvas anchor
        url: 'https://admin.5smiths.com.au/app/XC_iOS_Ad_Hoc_.mobileprovision';
        with: [ 
              (canvas tag: 'i')
                fontAwesome;
                fontAwesome2x;
                fontAwesomeShieldIcon.
              canvas
                space;
                text: 'iOS Provisioning Profile AdHoc' ] ].
  canvas
    paragraph: [ 
      canvas anchor
        url:
            'https://admin.5smiths.com.au/app/XC_iOS_Ad_Hoc_earthmynationnetworks.mobileprovision';
        with: [ 
              (canvas tag: 'i')
                fontAwesome;
                fontAwesome2x;
                fontAwesomeShieldIcon.
              canvas
                space;
                text: 'iOS Provisioning Profile NetWorks' ] ].
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
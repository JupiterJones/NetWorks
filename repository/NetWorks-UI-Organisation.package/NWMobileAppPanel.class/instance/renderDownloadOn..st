rendering
renderDownloadOn: canvas
  | appVersion |
  appVersion := '2.2.4'.
  canvas heading
    level4;
    with: 'Version ' , appVersion.
  canvas
    paragraph: [ 
      canvas
        text:
          'During the beta testing phase of the app release, the 5Smiths NetWorks app will be distributed through TestFlight. You can '.
      canvas anchor
        url: 'https://itunes.com/apps/TestFlight';
        target: 'AppStore';
        with: 'install TestFlight'.
      canvas text: ' from the AppStore.' ].
  canvas
    paragraph: [ 
      canvas text: 'Send this '.
      canvas anchor
        url:
            'mailto:jupiter.jones@mail.com?subject=5Smiths NetWorks TestFlight Request&body=Please send me an invitation to test 5Smiths NetWorks through TestFlight';
        with: 'email'.
      canvas
        text:
          ' to receive an invitation to test 5Smiths NetWorks though TestFlight.' ]
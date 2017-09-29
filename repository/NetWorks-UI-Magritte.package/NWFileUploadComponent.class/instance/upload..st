actions
upload: aFile
  self
    value:
      (aFile isNil
        ifFalse: [ 
          NWExternalFileModel new
            locationLookupBlock:
                (self magritteDescription propertyAt: 'locationLookupBlock');
            urlLookupBlock:
                (self magritteDescription propertyAt: 'urlLookupBlock');
            filename: aFile fileName;
            mimetype: aFile contentType greaseString;
            contents: aFile rawContents;
            yourself ])
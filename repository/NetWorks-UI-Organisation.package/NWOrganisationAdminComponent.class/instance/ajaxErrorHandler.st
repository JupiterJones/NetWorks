timeout handler
ajaxErrorHandler
  " If the ajax callback error was timeout...then we alert the user and forward to login again. If it was an ajax error callback, then we display a modal showing all the available error information. See #renderSupportForAjaxErrorHandlerOn: for more details.
Also... note that in DpQuuveProductionWalkbackErrorHandler >> open: (our custom Seaside error handler for GemStone), when there is an AJAX error, in the response object we write a JSON serialized dictionary with all the error information (see #respondFromAjaxRequestWith:continuation:). Therefore, what we must do here is to read the response (will be JSON), parse that, and get the useful information. Finally, refresh the 
'ajaxErrorDialog' with the error info we got and finally show the dialog.
"

  ^ ' if (jqxhr.status == 403) {
            alert("For security reasons we sign people out during periods of inactivity. Please sign in again.");
            window.location.href = settings.url.split("?")[0].replace("help","");
        } else {

		// This is on purpose because sometimes with TinyMCE we would get status 0 and empty error...when there was no error
		// The reason is explained in: http://bartwullems.blogspot.com.ar/2012/02/ajax-request-returns-status-0.html
		if (jqxhr.readyState == 0 || jqxhr.status == 0) {  
		    return; //Skip this error  
		 };

		// Lets write to console all error info possbile
		  var requestResponse = {
		    url: settings.url,
		    method: settings.type,
		    data: settings.data,
		    httpStatus: jqxhr.status,
		    error: exception || jqxhr.statusText,
		    data: settings.data
		  };

	
		responseText = jqxhr.responseText;
		responseText.replace(/[\\"'']/g, ''\\$&'').replace(/\u0000/g, ''\\0''); 
		jsonValue = jQuery.parseJSON(responseText);
		console.error(jsonValue);

		$(''#ajaxErrorDialog'').find(''.errorTitle'').html(''<span style="color:#4F2817;">''+jsonValue.errorTitle+''</span>''); 
		$(''#ajaxErrorDialog'').find(''.exceptionDescription'').html(''<span style="color:#4F2817;">''+jsonValue.exceptionDescription+''</span>''); 
		$(''#ajaxErrorDialog'').find(''.dateAndTime'').html(''<span style="color:#4F2817;">''+jsonValue.dateAndTime+''</span>''); 
		$(''#ajaxErrorDialog'').find(''.continuationOop'').html(''<span style="color:#4F2817;">''+jsonValue.continuationOop+''</span>''); 
		$(''#ajaxErrorDialog'').find(''.packagesVersions'').html(''<span style="color:#4F2817;">''+jsonValue.packagesVersions+''</span>''); 
		$(''#ajaxErrorDialog'').find(''.sitePrefix'').html(''<span style="color:#4F2817;">''+jsonValue.sitePrefix+''</span>''); 
		$(''#ajaxErrorDialog'').find(''.user'').html(''<span style="color:#4F2817;">''+jsonValue.user+''</span>''); 		
		$(''#ajaxErrorDialog'').find(''.gemPid'').html(''<span style="color:#4F2817;">''+jsonValue.gemPid+''</span>''); 	
		$(''#ajaxErrorDialog'').find(''.gemSessionID'').html(''<span style="color:#4F2817;">''+jsonValue.gemSessionID+''</span>''); 

		$(''#ajaxErrorDialog'').modal(''show'');

        }'
nginx
organisationNginxTemplateEnabled: isEnabled
  "Load the nginx configuration for an organisation"

  ^ MustacheTemplate
    on:
      (self nginxConfigurationDirectory
        readOnlyFileNamed:
          (isEnabled
            ifTrue: [ 'enabled.org.nginx.template' ]
            ifFalse: [ 'disabled.org.nginx.template' ]))
        contents
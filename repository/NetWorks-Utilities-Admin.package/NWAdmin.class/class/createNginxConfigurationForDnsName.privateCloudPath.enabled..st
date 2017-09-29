nginx
createNginxConfigurationForDnsName: dnsName privateCloudPath: cloudPath enabled: isEnabled
  "Create a nginx configuration and install it."

  (self nginxOrganisationDirectory forceNewFileNamed: dnsName , '.conf')
    nextPutAll:
        ((self organisationNginxTemplateEnabled: isEnabled)
            value:
              (Dictionary new
                at: 'dnsName' put: dnsName;
                at: 'cloudPath' put: cloudPath;
                yourself));
    close
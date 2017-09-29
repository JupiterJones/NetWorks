nginx
removeNginxConfigurationForDnsName: dnsName
  "Remove the nginx configuration for this dns name if it exists"

  | directory configurationName |
  configurationName := dnsName , '.conf'.
  ((directory := self nginxOrganisationDirectory) fileExists: configurationName)
    ifTrue: [ directory deleteFileNamed: configurationName ]
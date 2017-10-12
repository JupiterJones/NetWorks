baseline
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        baseline: 'Seaside3'
          with: [ 
              spec
                loads: #('Core' 'Development' 'Zinc');
                repository:
                    'filetree:///opt/git/JupiterSmalltalk/Seaside/repository' ];
        configuration: 'Magritte3'
          with: [ 
              spec
                versionString: '3.5.1';
                repository:
                    'http://www.smalltalkhub.com/mc/Magritte/Magritte3/main' ];
        configuration: 'Magritte3AddOns'
          with: [ 
              spec
                versionString: '3.1.3';
                repository:
                    'http://www.smalltalkhub.com/mc/Magritte/Magritte3Addons/main' ];
        configuration: 'Bootstrap'
          with: [ 
              spec
                versionString: '0.16.0';
                repository:
                    'http://smalltalkhub.com/mc/TorstenBergmann/Bootstrap/main' ];
        configuration: 'BootstrapMagritte'
          with: [ 
              spec
                versionString: '0.2.3';
                repository:
                    'http://www.smalltalkhub.com/mc/TorstenBergmann/BootstrapMagritte/main' ];
        baseline: 'Cryptography'
          with: [ 
              spec
                loads: #('CI');
                repository: 'github://GsDevKit/Cryptography:master/repository' ];
        configuration: 'FontAwesome'
          with: [ 
              spec
                versionString: '0.6.0';
                repository:
                    'http://www.smalltalkhub.com/mc/TorstenBergmann/FontAwesome/main' ];
        configuration: 'Mustache'
          with: [ 
              spec
                versionString: #'stable';
                loads: #('Core');
                repository:
                    'http://www.smalltalkhub.com/mc/NorbertHartl/Mustache/main' ];
        configuration: 'InfoVis'
          with: [ 
              spec
                versionString: '1.1';
                loads: #('Core' 'Examples');
                repository:
                    'http://www.smalltalkhub.com/mc/hkleinsorgen/InfoVis/main' ];
        baseline: 'Parasol'
          with: [ spec repository: 'filetree:///opt/git/JupiterSmalltalk/Parasol/repository' ];
        baseline: 'JQueryWidgetKit'
          with: [ spec repository: 'github://JQueryWidgetKit/JQueryWidgetKit/repository' ];
        baseline: 'AdminLTE'
          with: [ spec repository: 'filetree:///opt/git/JupiterSmalltalk/AdminLTE/repository' ].
      spec package: 'NetWorks-App-API' ].
  spec
    for: #'common'
    do: [ 
      spec
        package: 'NetWorks-Model-Magritte';
        package: 'NetWorks-Model-FileSystem'
          with: [ spec requires: #('NetWorks-Model-Core') ];
        package: 'NetWorks-Model-Core'
          with: [ spec requires: #('NetWorks-Model-Magritte') ];
        package: 'NetWorks-Model-Contractors'
          with: [ spec requires: #('NetWorks-Model-Core') ];
        package: 'NetWorks-Model-Jobs'
          with: [ 
              spec
                requires:
                  #('NetWorks-Model-Core' 'NetWorks-Model-Assets' 'NetWorks-Model-Workflow') ];
        package: 'NetWorks-Model-Tests'
          with: [ spec requires: #('NetWorks-Model-Core') ];
        package: 'NetWorks-Model-WorkOrders'
          with: [ 
              spec
                requires:
                  #('NetWorks-Model-Tests' 'NetWorks-Model-Jobs' 'NetWorks-Model-Contractors') ];
        package: 'NetWorks-Model-Assets'
          with: [ spec requires: #('NetWorks-Model-Core' 'InfoVis') ];
        package: 'NetWorks-Model-Workflow'
          with: [ spec requires: #('NetWorks-Model-Core') ];
        package: 'NetWorks-Model-Admin'
          with: [ 
              spec
                requires:
                  #('Cryptography' 'NetWorks-Model-Core' 'NetWorks-Model-FileSystem' 'NetWorks-Model-Organisation' 'NetWorks-Model-Projects') ];
        package: 'NetWorks-Model-Organisation'
          with: [ spec requires: #('NetWorks-Model-Core' 'NetWorks-Model-Contractors') ];
        package: 'NetWorks-Model-Integration'
          with: [ spec requires: #('NetWorks-Model-Core') ];
        package: 'NetWorks-Model-Projects'
          with: [ 
              spec
                requires:
                  #('NetWorks-Model-Core' 'NetWorks-Model-Jobs' 'NetWorks-Model-WorkOrders' 'NetWorks-Model-Integration') ];
        package: 'NetWorks-UI-Core'
          with: [ 
              spec
                requires:
                  #('FontAwesome' 'NetWorksModel' 'NetWorks-UI-Announcements' 'NetWorks-UI-Magritte') ];
        package: 'NetWorks-UI-Magritte'
          with: [ spec requires: #('NetWorks-Model-Magritte') ];
        package: 'NetWorks-UI-Admin'
          with: [ spec requires: #('NetWorks-UI-Core' 'NetWorks-UI-Announcements' 'AdminLTE') ];
        package: 'NetWorks-UI-Projects'
          with: [ spec requires: #('NetWorks-Model-Projects') ];
        package: 'NetWorks-UI-Contractors'
          with: [ spec requires: #('NetWorks-UI-Core') ];
        package: 'NetWorks-UI-Assets'
          with: [ spec requires: #('NetWorks-UI-Core') ];
        package: 'NetWorks-UI-Jobs'
          with: [ spec requires: #('NetWorks-UI-Core') ];
        package: 'NetWorks-UI-Clients'
          with: [ spec requires: #('NetWorks-UI-Core') ];
        package: 'NetWorks-UI-TestTypes'
          with: [ spec requires: #('NetWorks-UI-Core') ];
        package: 'NetWorks-UI-WorkOrders'
          with: [ spec requires: #('NetWorks-UI-Core') ];
        package: 'NetWorks-UI-Integration'
          with: [ spec requires: #('NetWorks-UI-Core') ];
        package: 'NetWorks-UI-Help'
          with: [ spec requires: #('NetWorks-UI-Core') ];
        package: 'NetWorks-UI-Organisation'
          with: [ 
              spec
                requires:
                  #('Mustache' 'NetWorks-UI-Core' 'NetWorks-UI-Help' 'NetWorks-UI-Assets' 'NetWorks-UI-TestTypes' 'NetWorks-UI-Clients' 'NetWorks-UI-Projects' 'NetWorks-UI-Jobs' 'NetWorks-UI-WorkOrders' 'NetWorks-UI-Contractors' 'NetWorks-UI-Integration' 'AdminLTE') ];
        package: 'NetWorks-UI-Announcements';
        package: 'NetWorks-App-Core'
          with: [ spec requires: #('Magritte3AddOns') ];
        package: 'NetWorks-Tests-Model-Core';
        package: 'NetWorks-Tests-Model-Admin'
          with: [ spec requires: #('NetWorks-Model-Admin') ];
        package: 'NetWorks-Tests-Model-Projects'
          with: [ spec requires: #('NetWorks-Model-Projects') ];
        package: 'NetWorks-Tests-Model-Jobs'
          with: [ spec requires: #('NetWorks-Model-Jobs') ];
        package: 'NetWorks-Tests-Model-WorkOrders'
          with: [ spec requires: #('NetWorks-Model-WorkOrders') ];
        package: 'NetWorks-Tests-Model-Organisation'
          with: [ spec requires: #('NetWorks-Model-Organisation') ];
        package: 'NetWorks-Tests-Model-Assets'
          with: [ spec requires: #('NetWorks-Model-Assets') ];
        package: 'NetWorks-Tests-Model-Workflow'
          with: [ spec requires: #('NetWorks-Model-Workflow') ];
        package: 'NetWorks-Tests-Model-FileSystem'
          with: [ spec requires: #('NetWorks-Model-Core') ];
        package: 'NetWorks-Tests-Model-Contractors'
          with: [ spec requires: #('NetWorks-Model-Contractors') ];
        package: 'NetWorks-Utilities-Admin'.
      spec
        group: 'NetWorksModel'
          with: #('Magritte3' 'NetWorks-Utilities-Admin' 'NetWorks-Model-Admin');
        group: 'NetWorksApp' with: #('NetWorks-App-Core');
        group: 'NetWorksUI'
          with:
            #('Seaside3' 'Bootstrap' 'BootstrapMagritte' 'JQueryWidgetKit' 'NetWorksModel' 'NetWorks-UI-Admin' 'NetWorks-UI-Organisation');
        group: 'NetWorksTests'
          with:
            #('NetWorks-Tests-Model-Core' 'NetWorks-Tests-Model-Admin' 'NetWorks-Tests-Model-Projects' 'NetWorks-Tests-Model-Jobs' 'NetWorks-Tests-Model-WorkOrders' 'NetWorks-Tests-Model-Organisation' 'NetWorks-Tests-Model-Assets' 'NetWorks-Tests-Model-Workflow' 'NetWorks-Tests-Model-FileSystem' 'NetWorks-Tests-Model-Contractors');
        group: 'default'
          with: #('NetWorksModel' 'NetWorksUI' 'NetWorksApp' 'NetWorksTests') ]
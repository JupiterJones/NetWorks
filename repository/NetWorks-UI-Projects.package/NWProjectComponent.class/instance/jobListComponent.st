components
jobListComponent
  | template |
  template := NWJob new.
  ^ self components
    at: #'jobList'
    ifAbsentPut: [ 
      NWGenericPanelComponent new
        icon: #'fontAwesomeBriefcaseIcon';
        title: 'Jobs';
        wrapperClass: 'jobsList';
        items: self project jobs;
        enableSearch;
        addFilter:
            (NWGenericPanelFilter new
                label: 'All';
                filterBlock: [ :job | true ];
                yourself);
        addFilter:
            (NWGenericPanelFilter new
                label: 'Unassigned';
                filterBlock: [ :job | job isAssigned not ];
                isExclusive: false;
                yourself);
        addFilter:
            (NWGenericPanelFilter new
                label: 'Unscheduled';
                filterBlock: [ :job | job isScheduled not ];
                isExclusive: false;
                yourself);
        reportColumns:
            template titleDescription , template jobSummaryDescription
                , template percentageCompleteDescription;
        subscribe: NWObjectsSelected
          do: [ :ann | self jobsSelected: ann ]
          for: self;
        subscribe: NWObjectsClicked
          do: [ :ann | self jobsClicked: ann ]
          for: self;
        enableDraggableToScopes: #('contractor');
        yourself ]
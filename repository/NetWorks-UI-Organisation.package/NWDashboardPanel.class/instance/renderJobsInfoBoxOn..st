rendering
renderJobsInfoBoxOn: canvas
  | jobs jobsComplete jobsCompletePercent jobsCompletedThisWeek |
  jobs := self model allJobs.
  jobsComplete := jobs select: [ :job | job isComplete ].
  jobsCompletedThisWeek := jobsComplete
    select: [ :job | (job completionDate ifNil: [ Date fromSeconds: 0 ]) > (Date today - 7 days) ].
  jobsCompletePercent := jobsComplete isEmpty
    ifTrue: [ 0 ]
    ifFalse: [ jobs size / jobsComplete size * 100 ].
  canvas tbsColumn
    mediumSize: 3;
    smallSize: 6;
    extraSmallSize: 12;
    with: [ 
          canvas
            render:
              (AdminLTEInfoBox2Widget new
                icon: #'folderOpenOutlined';
                label: 'Jobs';
                number: jobs size;
                widgetColor: 'aqua';
                progressValue: jobsCompletePercent;
                progressDescription:
                    'Completed ' , jobsCompletedThisWeek size asString , ' this week';
                yourself) ]
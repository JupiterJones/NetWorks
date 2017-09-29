rendering
renderWorkOrdersInfoBoxOn: canvas
  | workOrders workOrdersComplete workOrdersCompletePercent workOrdersCompletedThisWeek |
  workOrders := self model allWorkOrders.
  workOrdersComplete := workOrders
    select: [ :workOrder | workOrder workflow == NWWorkflow completedStatus ].
  workOrdersCompletedThisWeek := workOrdersComplete
    select: [ :workOrder | 
      (workOrder completionDate ifNil: [ Date fromSeconds: 0 ])
        > (Date today - 7 days) ].
  workOrdersCompletePercent := workOrdersComplete isEmpty
    ifTrue: [ 0 ]
    ifFalse: [ workOrdersComplete size / workOrders size * 100 ].
  canvas tbsColumn
    mediumSize: 3;
    smallSize: 6;
    extraSmallSize: 12;
    with: [ 
          canvas
            render:
              (AdminLTEInfoBox2Widget new
                icon: #'wrench';
                label: 'Work Orders';
                number: workOrders size;
                widgetColor: 'aqua';
                progressValue: workOrdersCompletePercent;
                progressDescription:
                    'Completed ' , workOrdersCompletedThisWeek size asString , ' this week';
                yourself) ]
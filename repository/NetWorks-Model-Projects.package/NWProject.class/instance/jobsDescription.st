descriptions
jobsDescription
  <magritteDescription>
  | template |
  template := NWJob new.
  ^ NWToManyRelationDescription new
    accessor: #'jobs';
    classes: {NWJob};
    reference:
        template titleDescription , template jobSummaryDescription
            , template percentageCompleteDescription;
    label: 'Jobs';
    priority: 400;
    beSorted;
    yourself
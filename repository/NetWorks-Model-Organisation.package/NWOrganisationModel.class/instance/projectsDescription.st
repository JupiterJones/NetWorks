descriptions
projectsDescription
  <magritteDescription>
  | template |
  template := NWProject new.
  ^ NWToManyRelationDescription new
    accessor: #'projects';
    classes: {NWProject};
    reference:
        template titleDescription , template clientTitleDescription
            , template numberOfJobsDescription;
    propertyAt: #'icon' put: 'briefcase';
    priority: 200;
    beSorted;
    yourself
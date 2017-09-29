accessing
infoBoxData
  ^ {(Dictionary new
    at: #'icon' put: 'buildingOutlined';
    at: #'label' put: 'Clients';
    at: #'number' put: 10380;
    at: #'widgetColor' put: 'aqua';
    at: #'progressValue' put: 30;
    at: #'progressDescription' put: 'Up 30% this week';
    at: #'footer' put: 'Up 30% this week';
    yourself).
  (Dictionary new
    at: #'icon' put: 'briefcase';
    at: #'label' put: 'Projects';
    at: #'number' put: 410;
    at: #'widgetColor' put: 'green';
    at: #'progressValue' put: 65;
    at: #'progressDescription' put: 'Up 65 this week';
    at: #'footer' put: 'Up 30% this week';
    yourself).
  (Dictionary new
    at: #'icon' put: 'folderOpenOutlined';
    at: #'label' put: 'Jobs';
    at: #'number' put: 13648;
    at: #'widgetColor' put: 'yellow';
    at: #'progressValue' put: 5;
    at: #'progressDescription' put: 'Up 5% this week';
    at: #'footer' put: 'Up 30% this week';
    yourself).
  (Dictionary new
    at: #'icon' put: 'wrench';
    at: #'label' put: 'Work Orders';
    at: #'number' put: 93139;
    at: #'widgetColor' put: 'red';
    at: #'progressValue' put: 90;
    at: #'progressDescription' put: 'Up 90% this week';
    at: #'footer' put: 'Up 30% this week';
    yourself)}
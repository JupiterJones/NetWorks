descriptions
titleDescription
  <magritteDescription>
  | description |
  description := super titleDescription.
  description propertyAt: #'icon' put: #'wrench'.
  ^ description
private
useDuring: aBlock
  "Make self current during aBlock"

  ^ [ NWCurrentOrganisation use: self during: aBlock ]
    ensure: [  ]
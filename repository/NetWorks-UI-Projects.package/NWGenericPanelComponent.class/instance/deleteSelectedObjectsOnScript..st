actions
deleteSelectedObjectsOnScript: script
  self announcer
    announce:
      (NWObjectsDeleted script: script objects: self reportComponent selectedItems)
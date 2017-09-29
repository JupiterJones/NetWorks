actions
updateItems: newItems
  self items: newItems.
  self displayItems: (self filterItems: items).
  self reportComponent selectedItems: #()
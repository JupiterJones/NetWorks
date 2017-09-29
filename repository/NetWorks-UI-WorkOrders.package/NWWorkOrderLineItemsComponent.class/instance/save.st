actions
save
  | template qty qtyComplete |
  template := NWWorkOrderLineItem new.
  (qtyComplete := self memento readUsing: template quantityCompleteDescription)
    > (qty := self memento readUsing: template quantityDescription)
    ifTrue: [ 
      (self
        call:
          (NWVariationConfirmation new
            requestedQuantity: qty;
            completedQuantity: qtyComplete;
            yourself))
        ifFalse: [ ^ nil ] ].
  super save
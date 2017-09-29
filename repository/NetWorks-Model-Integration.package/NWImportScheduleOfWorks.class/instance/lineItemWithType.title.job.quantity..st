private
lineItemWithType: lineItemType title: title job: job quantity: quantity
  ^ NWJobLineItem new
    job: job;
    lineItemType: lineItemType;
    quantity: quantity asNumber;
    yourself
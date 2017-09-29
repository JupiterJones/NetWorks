private
buildReport
  ^ (NWMagritteReport rows: self value description: self reference)
    sortEnabled: self magritteDescription sorted;
    yourself
actions
import
  | file |
  document := NeoCSVReader on: (ReadStream on: rawData).
  self addFieldsToDocument.
  rows := document upToEnd.
  self
    createModel;
    installModel
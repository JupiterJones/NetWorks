JSON
toolTipFunction
  ^ 'tip.innerHTML =  "<b>" + node.name + "</b><p/>" + node.data.comment'
    asFunction: #(#'tip' #'node')
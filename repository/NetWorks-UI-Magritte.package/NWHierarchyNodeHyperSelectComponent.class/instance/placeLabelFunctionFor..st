rendering
placeLabelFunctionFor: graph
  ^ JSStream on: '
            var style = label.style;
            style.display = "";
            style.cursor = "pointer";

            if (node._depth <= 1) {
                style.fontSize = "0.8em";
                style.color = "#ccc";
            
            } else if(node._depth == 2){
                style.fontSize = "0.6em";
                style.color = "#888";
            
            } else {
                style.display = "none";
            }

            var left = parseInt(style.left);
            var w = label.offsetWidth;
            style.left = (left - w / 2) + "px";
'
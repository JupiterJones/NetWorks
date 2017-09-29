JSON
labelFunctionFor: spaceTree
  ^ JSStream
    on:
      '
            label.id = node.id;            
            label.innerHTML = "<b>" + node.name + "</b><a href=#>Add</a></form>";
            label.onclick = function(){
			'
        , spaceTree variableNameNeeded
        ,
          '.onClick(node.id);
            };
            //set label styles
            var style = label.style;
            style.width = "160px";
            style.height = "20px";
            style.cursor = "pointer";
            style.color = "#FFF";
            style.fontSize = "0.8em";
            style.textAlign= "center";
            style.paddingTop = "3px";
'
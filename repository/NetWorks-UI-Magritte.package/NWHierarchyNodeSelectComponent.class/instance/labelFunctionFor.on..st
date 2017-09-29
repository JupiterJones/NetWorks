json
labelFunctionFor: spaceTree on: html
  | stream |
  stream := JSStream new.
  stream
    nextPutAll:
      '
            label.id = node.id;            
            label.innerHTML = "<b>" + node.name + "</b>";

if(node.selected) { label.style.backgroundColor="#00F"; }
            label.onclick = function(){node.selected=true;'.
  self magritteDescription isReadonly
    ifFalse: [ 
      stream
        nextPutAll:
            (html jQuery ajax
                callback: [ :value | self value: (passengers at: value) ]
                value: (JSStream on: 'node.id')) greaseString;
        nextPutAll: ';' , spaceTree variableNameNeeded , '.onClick(node.id);' ].
  stream
    nextPutAll:
      spaceTree variableNameNeeded
        ,
          '.fx.animate({  
        modes: ["node-property:style:backgroundColor"]}); 
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
'.
  ^ stream
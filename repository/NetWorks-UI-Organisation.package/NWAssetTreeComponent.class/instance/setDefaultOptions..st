options
setDefaultOptions: aVisualisation
  aVisualisation marginOptions
    top: 5;
    left: 5;
    right: 5;
    bottom: 5.
  self setDefaultLabelOptions: aVisualisation.
  self toolTipFunction
    ifNotNil: [ :toolTipFunction | 
      aVisualisation tipOptions
        renderLikeLabels;
        enable: true;
        onShow: toolTipFunction ]
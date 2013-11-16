(function(){
  var globeOutputBinding = new Shiny.OutputBinding();
  $.extend(globeOutputBinding, {
    find: function(scope) {
      return $(scope).find('.shiny-globe-output');
    },
    renderValue: function(el, data) {      
      if (!data){
        return;
      }
      
      // Clear out old globe.
      $(el).html("")
      
      if(!Detector.webgl){
        Detector.addGetWebGLMessage();
      } else {
        // Create from scratch
        var container = document.getElementById(el.id);
        var globe = new DAT.Globe(container);
  
        var i, tweens = [];
        
        TWEEN.start();
        
        var data = JSON.parse(data);
        $(el).data('globedata', data);
        for (i=0;i<data.length;i++) {
          globe.addData(data[1], {format: 'magnitude', name: data[0], animated: true});
        }
        globe.createPoints();
        globe.time = 0;
        globe.animate();
        document.body.style.backgroundImage = 'none'; // remove loading
      }
    }
  });
  Shiny.outputBindings.register(globeOutputBinding, 'shinyGlobe.globebinding');
})();
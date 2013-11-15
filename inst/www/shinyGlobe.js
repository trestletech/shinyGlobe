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
      
      console.log(data);
      
      
      if(!Detector.webgl){
        Detector.addGetWebGLMessage();
      } else {
  
        var years = ['1990','1995','2000'];
        var container = document.getElementById(el.id);
        var globe = new DAT.Globe(container);
  
        var i, tweens = [];
        
        var settime = function(globe, t) {
          return function() {
            new TWEEN.Tween(globe).to({time: t/years.length},500).easing(TWEEN.Easing.Cubic.EaseOut).start();
          };
        };
              
        TWEEN.start();
        
        var data = JSON.parse(data);
        $(el).data('globedata', data);
        for (i=0;i<data.length;i++) {
          globe.addData(data[i][1], {format: 'magnitude', name: data[i][0], animated: true});
        }
        globe.createPoints();
        settime(globe,0)();
        globe.animate();
        document.body.style.backgroundImage = 'none'; // remove loading
      }     
    }
  });
  Shiny.outputBindings.register(globeOutputBinding, 'shinyGlobe.globebinding');
})();
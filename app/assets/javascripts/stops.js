$(document).on('ready', function(){
	var client_lat;
  var client_lon;
  $.getJSON("http://smart-ip.net/geoip-json?callback=?",
    function(data){
       client_lat = data.latitude;
       client_lon = data.longitude;
  });

  
	var cloudmade = new CM.Tiles.CloudMade.Web({key: '7324c064b04d402eb2a58d68c935b63d'});
  var map = new CM.Map('cm-example', cloudmade);
  map.setCenter(new CM.LatLng(client_lat, client_lon), 15);
	map.addControl(new CM.LargeMapControl());
	
});

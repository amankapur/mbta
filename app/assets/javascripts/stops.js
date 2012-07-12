$(document).on('ready', function(){
	var client_ip;
	$.getJSON("http://jsonip.appspot.com?callback=?",
    function(data){
       client_ip = data.ip;
  });
  var client_lat;
  var client_lon;
  alert(client_ip);
  $.getJSON("http://api.hostip.info/get_html.php?ip=" + client_ip + "&position=true", 
  		function(data) {
  			client_lat = data.lat
  			client_lon = data.lng
  		});
  		
	var cloudmade = new CM.Tiles.CloudMade.Web({key: '7324c064b04d402eb2a58d68c935b63d'});
  var map = new CM.Map('cm-example', cloudmade);
  map.setCenter(new CM.LatLng(client_lat, client_lon), 15);
	map.addControl(new CM.LargeMapControl());
	
});

// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
//= require underscore
//= require gmaps/google

function loadMap() {
  var lat = 51.509865
  var lng = -0.118092
  var mapOptions = {
    center: new google.maps.LatLng(lat, lng),
    zoom: 10
  };
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: mapOptions, internal: {id: 'map'}}, function(){});
  map = handler.getMap();
}

function loadMarker(list) {
  hash = list["message"]
  marker = new google.maps.Marker({
    map: map,
    position: hash
  });
  marker.setMap(map)
}

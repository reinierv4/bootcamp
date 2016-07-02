if ("geolocation" in navigator) {
  var button = document.getElementById('where-am-i');
  button.addEventListener('click', getLocation);
} else {
  alert("Geolocation is not available")
}

function getLocation() {
  console.log('Getting location...'); 
  navigator.geolocation.getCurrentPosition(onLocation, onError, options);
}

var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};

function onLocation (position) {
  console.log("Got it!");
  var lat = position.coords.latitude;
  var lon = position.coords.longitude;
  document.getElementById('location').innerHTML = "Your posititon is " + lat + " latitude and " + lon + " longitude.";
  displayMap(lat, lon);
}

function onError(error) {
  console.log("Getting location failed: " + error);
}

function displayMap(lat, lon) {
  var urlRoot = "https://maps.googleapis.com/maps/api/staticmap?center=";
  var urlParams = "&zoom=13&size=400x300";
  var url = urlRoot + lat + "," + lon + urlParams;
  var map = document.getElementById('map');
  map.setAttribute("src", url);
  console.log(url);
}
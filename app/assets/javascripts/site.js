var options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 0
};

function success(pos) {
  var crd = pos.coords;
  lat = crd.latitude;
  lon = crd.longitude;

  $.getJSON("nearby_buses?lat=" + lat + "&long=" + lon, function(data) {
    console.log(data);
  });

};

function error(err) {
  console.warn('ERROR(' + err.code + '): ' + err.message);
};


$('#network').on("click", function() {
  navigator.geolocation.getCurrentPosition(success, error, options);
});

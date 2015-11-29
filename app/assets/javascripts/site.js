function success(pos) {
  var crd = pos.coords;
  lat = crd.latitude;
  lon = crd.longitude;

  $.getJSON("nearby_buses?lat=" + lat + "&long=" + lon, function(data) {
    $("#template").html(HandlebarsTemplates["site/location"](data));
  });
};

function error(err) {
  console.warn('ERROR(' + err.code + '): ' + err.message);
};

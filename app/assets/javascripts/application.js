// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require handlebars
//= require_tree ./templates
//= require_tree .

$(function(){ $(document).foundation(); });

function nearbyStations() {
  var options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0
  };

  navigator.geolocation.getCurrentPosition(success, error, options);
};

$("#template").on("click", function(el) {
  el = event.target;

  if (el.tagName == 'A' && el.classList.contains("station")) {
    var stationCode = event.target.dataset.panel;

    if ($("#panel" + stationCode).length < 1) {
      reload_station(el.parentElement);
    };

    $("#" + stationCode).slideToggle('fast');
    return false;

  } else if (el.tagName == "I") {
    reload_station(el.parentElement);
    return false;

  } else {
    return true;
  };

});

function reload_station(el) {
  stationCode = el.dataset.station;
  $.getJSON("reload_station?station=" + stationCode, function(data) {
    $("#" + stationCode).html(HandlebarsTemplates["site/buses"](data));
  });

};

if ($('#location').length > 0) {
  nearbyStations();
};

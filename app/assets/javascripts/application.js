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

$("#template").on("click", function(e) {
  el = event.target;

  console.log(event.target);
  if (el.tagName == 'A' && el.classList.contains("station")) {
    var station_code = event.target.dataset.panel;
    $("#" + station_code).slideToggle('fast');
    return false;

  } else if (el.tagName == "I") {
    reload_station(el.parentElement);

  } else {
    return true;
  };

});

function reload_station(el) {
  stationCode = el.dataset.station;
  $.getJSON("site/reload_station?station=" + stationCode, function(data) {
    $("#" + stationCode).html(HandlebarsTemplates["site/buses"](data));
  });

};

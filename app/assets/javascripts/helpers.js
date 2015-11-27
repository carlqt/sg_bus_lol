Handlebars.registerHelper('displayTime', function(time) {
  if (time == undefined) return("Not Available")
  if (time <= 0) return("Arriving")
  if (time == 1) return("1 minute")
  return time + " minutes"
});

Handlebars.registerHelper('colorCode', function(time) {
  if (time == null) return null

  if (time >= 10) {
    return "alert"
  } else if (time < 10 && time >= 5) {
    return "warning"
  } else {
    return "success"
  }
});

document.addEventListener("turbolinks:load", function() {
  if (document.location.pathname == "/schedule") {
    $('select').on('change', function() {
      if ($('select#savedCars option:selected').text() != "Use New Car") {
        var year_make_model = $('select#savedCars option:selected').text().split(" ");
          $('input#vehicleYear').val(year_make_model[0]);
          $('input#vehicleMake').val(year_make_model[1]);
          $('input#vehicleModel').val(year_make_model[2]);
          $('input#vehicleVin').val(this.value);
        } else {
          $('input#vehicleYear').val("");
          $('input#vehicleMake').val("");
          $('input#vehicleModel').val("");
          $('input#vehicleVin').val("");
        }
    });
  }
})
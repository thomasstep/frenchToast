document.addEventListener("turbolinks:load", function() {
  if (document.location.pathname == "/schedule") {
    $('select').on('change', function() {
      if ($('select#savedCars option:selected').text() != "Use New Car") {
        var year_make_model = $('select#savedCars option:selected').text().split(" ");
          $('input#appointment_year').val(year_make_model[0]);
          $('input#appointment_make').val(year_make_model[1]);
          $('input#appointment_model').val(year_make_model[2]);
          $('input#appointment_VIN').val(this.value);
        } else {
          $('input#appointment_year').val("");
          $('input#appointment_make').val("");
          $('input#appointment_model').val("");
          $('input#appointment_VIN').val("");
        }
    });
  }
})
document.addEventListener("turbolinks:load", function() {
  if (document.location.pathname == "/schedule") {
    $('select#savedCars').on('change', function() {
      if ($('select#savedCars option:selected').text() != "Use New Car") {
        var year_make_model = $('select#savedCars option:selected').text().split(" ");
          $('input#appointment_year').val(year_make_model[0]).prop('readonly', true);
          $('input#appointment_make').val(year_make_model[1]).prop('readonly', true);
          $('input#appointment_model').val(year_make_model[2]).prop('readonly', true);
          $('input#appointment_VIN').val(this.value).prop('readonly', true);
        } else {
          $('input#appointment_year').val("").prop('readonly', false);
          $('input#appointment_make').val("").prop('readonly', false);
          $('input#appointment_model').val("").prop('readonly', false);
          $('input#appointment_VIN').val("").prop('readonly', false);
        }
    });
  }
})

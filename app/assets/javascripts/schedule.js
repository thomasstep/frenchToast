$(document).ready(function(){
  if (document.location.pathname == "/schedule") {
    $('select').on('change', function() {
      var year_make_model = $('select#savedCars option:selected').text().split(" ");
      console.log(year_make_model);
      $('input#vehicleYear').val(year_make_model[0]);
      $('input#vehicleMake').val(year_make_model[1]);
      $('input#vehicleModel').val(year_make_model[2]);
      $('input#vehicleVin').val(this.value);
    });
  }
});
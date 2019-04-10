$(document).ready(function(){
  if (document.location.pathname == "/schedule") {
    $('select').on('change', function() {
      alert(this.value);
      alert(this);
    });
  }
});
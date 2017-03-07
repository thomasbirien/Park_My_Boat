$(function() {
  $(".btn-secondary").on("click", function(event) {
    event.preventDefault();
    if ($(".options").is(":visible")) { // visible
      $(".options").slideUp();
    } else  {
      $(".options").slideDown();
    }
  });
});


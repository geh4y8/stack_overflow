$(function() {

  $(".bestanswerchoice").click(function() {
    $('form').removeClass("selected");
    $(this).parent().addClass("selected")
    $(".bestanswerchoice").remove();
  });
});

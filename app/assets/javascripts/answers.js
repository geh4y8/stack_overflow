$(function() {
  $(".bestanswerchoice").click(function() {
    $(this).parent().addClass("selected")
    $(".bestanswerchoice").remove();
  });
});

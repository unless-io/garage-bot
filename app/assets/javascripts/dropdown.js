$(document).ready(function(){
  $('.navbar-dropdown').dropdown({
    belowOrigin: true
  });

  $('#category-question').on('change',function(){
    console.log($('.active.selected span').text());
    if ($('.active.selected span').text() == "Multiple choice") {
      $('#multiple-choice').slideDown("slow", function() {
        $('#multiple-choice').removeClass('hidden');
      })
    }
    else {
      $('#multiple-choice').slideUp("slow", function() {
        $('#multiple-choice').addClass('hidden');
      })
    }
  })
})

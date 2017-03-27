$('.alert button').click(function(){
  $( ".alert" ).slideUp( "fast", function() {
    $('.alert').css('display', 'none');
  });
});

$( ".alert" ).fadeOut(3000);
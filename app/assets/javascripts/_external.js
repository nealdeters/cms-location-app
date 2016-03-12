$(document).ready (function(){

  $('[data-toggle=popover]').popover({
      content: $('#myPopoverContent').html(),
      html: true
  });
  
  $(".alert-dismissible").fadeTo(2000, 500).slideUp(500, function(){
      $(".alert-dismissible").alert('close');
  });  

  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
  }) 

  $(window).load(function() {
    $('.flexslider').flexslider();
  });
  
});
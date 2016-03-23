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

  // $(window).load(function() {
  //   $('.flexslider').flexslider();
  // });

  $('.carousel').carousel({
    interval: 6000
  })

  $(function() {
    var loc = window.location.href; // returns the full URL
    if(/contact/.test(loc)) {
      $('.header').addClass('navbar-fixed-top');
    }
  });
  
  // location progress bar
  $(window).load(function() {
      var formCount = $('input.form-control').length;
      var filledFormsCount = $('input.form-control').filter(function () {
          return $(this).val() !== "";
      }).length;
      // var width = Math.round(((1 / formCount) * (formCount - (filledFormsCount - 1))) * 100);
      var width = Math.round((filledFormsCount/formCount) * 100);
      var formPerfect = width + "%";
      $("#bar").css("width", formPerfect).text(formPerfect);
      if (width === 100) {
          $("#bar").removeClass("progress-bar-striped");
      } else {
          $("#bar").addClass("progress-bar");
      }

    $(".form-control").on('change paste', function () {
      var formCount = $('input.form-control').length;
      var filledFormsCount = $('input.form-control').filter(function () {
          return $(this).val() !== "";
      }).length;
      // var width = Math.round(((1 / formCount) * (formCount - (filledFormsCount - 1))) * 100);
      var width = Math.round((filledFormsCount/formCount) * 100);
      var formPerfect = width + "%";
      $("#bar").css("width", formPerfect).text(formPerfect);
      if (width === 100) {
          $("#bar").removeClass("progress-bar-striped");
      } else {
          $("#bar").addClass("progress-bar");
      }
    });

  });

});
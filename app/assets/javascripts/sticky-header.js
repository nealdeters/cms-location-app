$(document).ready(function() {
  
  /* ======= Fixed header when scrolled ======= */
  $(window).bind('scroll', function() {
       if ($(window).scrollTop() > 0) {
           $('#header').addClass('navbar-fixed-top');
       }
       else {
          var loc = window.location.href; // returns the full URL
          
          if(/contact/.test(loc)) {
            
          } else {
            $('#header').removeClass('navbar-fixed-top');
          }
       }
  });
  /* ======= Fixed header end ======= */
});
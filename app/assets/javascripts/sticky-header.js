$(document).ready(function() {
  
  /* ======= Fixed header when scrolled ======= */
  $(window).bind('scroll', function() {
       if ($(window).scrollTop() > 80) {
           $('#header').addClass('navbar-fixed-top');
       }
       else {
           $('#header').removeClass('navbar-fixed-top');
       }
  });
  /* ======= Fixed header end ======= */
});
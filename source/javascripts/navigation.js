$(document).ready(function(){
  $('.navbar-collapse').on('click', function(e) {
    $('.navbar-collapse').collapse('hide');
  });
});

$(window).on('scroll', function(e) {
  navigation();
});

function navigation() {
  var scrolled = $(window).scrollTop();
  var breakpoint = $('.js-trigger-navigation').outerHeight() - $('#header .navbar').height();

  $('.navbar-transparent').toggleClass('navbar-light', (scrolled > breakpoint));
}

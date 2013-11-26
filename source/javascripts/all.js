//= require_tree .

$(document).ready(function(){
  $("#project-media .media").fitVids();
});

$(window).on('scroll', function(e) {
  parallax();
  navigation();
});

function parallax() {
  var scrolled = $(window).scrollTop();

  $('#masthead').css('background-position', ['0px', -(scrolled * 0.3) + 'px'].join(' '));
}


function navigation() {
  var scrolled = $(window).scrollTop();
  var breakpoint = $('#masthead').outerHeight() - $('#header .navbar').height();

  $('.navbar-transparent').toggleClass('navbar-light', (scrolled > breakpoint));
}

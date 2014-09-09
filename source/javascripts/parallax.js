$(window).on('scroll', function(e) {
  parallax();
});

function parallax() {
  var scrolled = $(window).scrollTop();

  $('#masthead').css('background-position', ['50%', -(scrolled * 0.3) + 'px'].join(' '));
}

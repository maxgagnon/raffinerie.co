//= require_tree .

$(window).on('scroll', function(e) {
  parallax();
});

function parallax() {
  var scrolled = $(window).scrollTop();

  $('#masthead').css('background-position', ['0px', -(scrolled * 0.3) + 'px'].join(' '));
}

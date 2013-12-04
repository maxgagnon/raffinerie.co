//= require_tree .

$(document).ready(function(){
  $("#project-media .media").fitVids();
  $(".vimeo").colorbox({ iframe: true, innerWidth: 800, innerHeight: 450 });
});


// Resize Colorbox when resizing window or changing mobile device orientation
$(window).resize(resizeColorBox);
window.addEventListener("orientationchange", resizeColorBox, false);

var resizeTimer;
function resizeColorBox()
{
  if (resizeTimer) clearTimeout(resizeTimer);
  resizeTimer = setTimeout(function() {
    if ($('#cboxOverlay').is(':visible')) {
      $.colorbox.resize({ width: '90%', height: '60%' });
    }
  }, 300);
}


$(document).ready(function() {
  $('.content.product .info .images a').fancybox({'type': 'ajax', 'showNavArrows': false})
  $('.content.product-images ul#thumbnails a').live('click', function(e) {
    e.preventDefault()
    var image_id = $(this).parent('li').attr('class')

    if ($('.content.product-images ul#images li.current.'+image_id).length == 0) {
      $('.content.product-images ul#images li.current').fadeOut(function() {
        $(this).removeClass('current')
        $('.content.product-images ul#images li.'+image_id).addClass('current').fadeIn()
      })
    }
  })
})

